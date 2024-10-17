//
//  Navigations.swift
//  Cats
//
//  Created by Diego Moreno on 17/10/24.
//

import Foundation
import SwiftUI

final class RootManager: ObservableObject {
    public enum Destination: Codable, Hashable {
//        case detail(id: Int)
        case favourites
    }
    
    @Published var path = NavigationPath()
    @Published var errorMessage = ""
    @Published var showError = false
    @Published var loading: Bool = false
    @Published var alert: BaseAlert.Model?
    
    func popToRoot() {
        guard !path.isEmpty else {
            return
        }
        path.removeLast(path.count)
    }
    
    func popToLast() {
        guard !path.isEmpty else {
            return
        }
        path.removeLast()
    }
    
    func push(_ destination: Destination) {
        path.append(destination)
    }
    
    func handleError(_ error: BaseError) {
        errorMessage = error.errorDescription().title
    }
    
    func showLoading() {
        loading = true
    }
    
    func hideLoading() {
        loading = false
    }
    
    func showAlert(alert: BaseAlert.Model) {
        print("RVM")
        self.alert = alert
    }
    
    func hideAlert() {
        self.alert = nil
    }
}
