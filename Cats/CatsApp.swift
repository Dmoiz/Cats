//
//  CatsApp.swift
//  Cats
//
//  Created by Diego Moreno on 15/10/24.
//

import SwiftUI

@main
struct CatsApp: App {
    
    @StateObject var rootManager = RootManager()
    
    var body: some Scene {
        WindowGroup {
            NavigationStack(path: $rootManager.path) {
                HomeWireframe(rootManager: rootManager).view
                    .navigationDestination(for: RootManager.Destination.self) { destination in
                        switch destination {
                        case .favourites:
                            ContentView()
                        }
                    }
            }
            .environmentObject(rootManager)
            alert()
            loader()
        }
    }
    
    @ViewBuilder func alert() -> some View {
        if let alert = rootManager.alert {
            BaseAlert(model: alert)
        }
    }

    @ViewBuilder func loader() -> some View {
        if rootManager.loading == true {
            BaseLoader()
        }
    }
}
