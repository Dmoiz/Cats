//
//  NetworkError.swift
//  Cats
//
//  Created by Diego Moreno on 17/10/24.
//

import Foundation

enum NetworkError: Error {
    case badResponse
    case unauthorized
    case serviceDown
    case notFound
    case unknown
}
