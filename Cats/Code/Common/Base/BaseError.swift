//
//  NetworkError.swift
//  Cats
//
//  Created by Diego Moreno on 17/10/24.
//

import Foundation

enum BaseError: Error {
    case generic
    case serviceUnavailbale//503
    case notFound//404
    case unknown//520
    
    func errorDescription() -> DescriptionError {
        var descriptionError: DescriptionError
        
        switch self {
        case .generic:
            descriptionError = DescriptionError(title: "Ha ocurrido un error inesperado", 
                                                description: "Inténtelo de nuevo más tarde",
                                                button: "Aceptar")
        case .serviceUnavailbale:
            descriptionError = DescriptionError(title: "Ha habido un error de conexión",
                                                description: "Inténtelo de nuevo más tarde",
                                                button: "Aceptar")
        case .notFound:
            descriptionError = DescriptionError(title: "Hay problemas de conexión",
                                                description: "Intentalo de nuevo más tarde",
                                                button: "Aceptar")
        case .unknown:
            descriptionError = DescriptionError(title: "Hay ocurrido un error desconocido",
                                                description: "Intentalo de nuevo más tarde",
                                                button: "Aceptar")
        }
        
        return descriptionError
    }
}

struct DescriptionError {
    var title, description, button: String
    var icon: String?
    
    init(title: String, description: String, icon: String? = nil, button: String) {
        self.title = title
        self.description = description
        self.icon = icon
        self.button = button
    }
}
