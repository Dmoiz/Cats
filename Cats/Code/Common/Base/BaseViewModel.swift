//
//  BaseViewModel.swift
//  Cats
//
//  Created by Diego Moreno on 17/10/24.
//

import SwiftUI
import Combine

class BaseViewModel: ObservableObject {
    
    var cancellables = Set<AnyCancellable>()
    var rootManager: RootManager
    
    init(rootManager: RootManager) {
        self.rootManager = rootManager
    }
    
    func manage(completion: Subscribers.Completion<BaseError>) {
        hideLoading()
        switch completion {
        case .failure(let baseError):
            var action: () -> Void
            action = {[weak self] in
                self?.hideAlert()
            }
            
            showAlert(alert: BaseAlert.Model(image: baseError.errorDescription().icon,
                                             title: baseError.errorDescription().title,
                                             description: baseError.errorDescription().description,
                                             buttonText1: baseError.errorDescription().button,
                                             feedback: .error,
                                             action1: action))
            
        default: break
        }
    }
    
    func showLoading() {
        rootManager.loading = true
    }
    
    func hideLoading() {
        rootManager.loading = false
    }
    
    func showAlert(alert: BaseAlert.Model) {
        rootManager.alert = alert
    }
    
    func hideAlert() {
        rootManager.hideAlert()
    }
    
}
