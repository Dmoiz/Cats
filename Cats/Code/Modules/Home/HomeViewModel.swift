//
//  HomeViewModel.swift
//  Cats
//
//  Created by Diego Moreno on 17/10/24.
//

import SwiftUI

class HomeViewModel: BaseViewModel {

    func soFunny() {
        showAlert(alert: BaseAlert.Model(title: "Hola", description: "Esto es una prueba", buttonText1: "Ok", action1: {
            self.hideAlert()
            self.rootManager.push(.favourites)
        }))
    }
}
