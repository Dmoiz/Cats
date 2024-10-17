//
//  BaseApiClient.swift
//  Cats
//
//  Created by Diego Moreno on 15/10/24.
//

import Foundation

class BaseApiClient {
    enum RequestType: String {
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

    private let header = [
        "x-api-key": "\(Environment.shared.apiKey)",
        "Content-Type": "application/json"
    ]
    
    func request(path: String, type: RequestType, queryItems: [URLQueryItem]? = [], params: [String: Any]? = nil) async throws -> (Data, HTTPURLResponse){
        
        var urlComponentes = URLComponents(url: baseURL.appendingPathComponent(path), resolvingAgainstBaseURL: true)
        
        urlComponentes?.queryItems = queryItems
        
        guard let url = urlComponentes?.url else {
            throw BaseError.generic
        }
        var request = URLRequest(url: url)
        request.httpMethod = type.rawValue
        request.allHTTPHeaderFields = header
        
        if let bodyParams = params {
            let jsonData = try! JSONSerialization.data(withJSONObject: bodyParams, options: [])
            request.httpBody = jsonData
        }
        
        let (data, response) = try await URLSession.shared.data(for: request)
        
        guard let response = response as? HTTPURLResponse else {
            throw BaseError.generic
        }
        
        switch response.statusCode {
        case 200:
            return (data, response)
        case 503:
            throw BaseError.serviceUnavailbale
        case 404:
            throw BaseError.notFound
        default:
            throw BaseError.unknown
        }
    }
}
