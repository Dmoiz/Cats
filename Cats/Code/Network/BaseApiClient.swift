//
//  BaseApiClient.swift
//  Cats
//
//  Created by Diego Moreno on 15/10/24.
//

import Foundation

class BaseApiClient {
    enum RequestType {
        case POST
        case GET
        case DELETE
    }
    
    private var baseURL: URL {
        if let url = URL(string: Environment.shared.baseURL) {
            return url
        } else {
            print("Invalid URL")
            return URL(string: "")!
        }
    }
    
    private var apiKey = Environment.shared.apiKey
    
    func request(path: String, type: RequestType, parameters: [URLQueryItem]? = []) async throws -> (Data, HTTPURLResponse){
        
        let url = baseURL.appendingPathComponent(path)
        var request = URLRequest(url: url)
        request.setValue(apiKey, forHTTPHeaderField: "x-api-key")
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let (data, response) = try await URLSession.shared.data(for: request)
        
        guard let response = response as? HTTPURLResponse else {
            throw NetworkError.badResponse
        }
        
        if response.statusCode == 200 {
            return (data, response)
        }
        
        switch response.statusCode {
        case 401:
            throw NetworkError.unauthorized
        case 522:
            throw NetworkError.serviceDown
        case 404:
            throw NetworkError.notFound
        default:
            throw NetworkError.unknown
        }
    }
}
