//
//  HomeWireframe.swift
//  Cats
//
//  Created by Diego Moreno on 17/10/24.
//

import SwiftUI

final class HomeWireframe {

//    private var navigationManager: NavigationManager
    private var rootManager: RootManager

    init(rootManager: RootManager) {
//        self.navigationManager = navigationManager
        self.rootManager = rootManager
    }

    var view: HomeView {
        HomeView(vm: self.viewModel)
    }

    private var viewModel: HomeViewModel {
        HomeViewModel(rootManager: rootManager)
    }

//    private var dataManager: HomeDataManager {
//        HomeDataManager(productsAPI: productsAPI, favoritesAPI: favoritesAPI, usersAPI: usersAPI)
//    }

//    private var productsAPI: ProductsAPI {
//        ProductsAPI()
//    }
    
//    private var favoritesAPI: FavoritesAPI {
//        FavoritesAPI()
//    }
//
//    private var usersAPI: UsersAPI {
//        UsersAPI()
//    }

    // MARK: - Public Functions

    func preview() -> some View {
        view
    }
}
