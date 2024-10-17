//
//  HomeView.swift
//  Cats
//
//  Created by Diego Moreno on 17/10/24.
//

import SwiftUI

struct HomeView: View {
    
    @EnvironmentObject var rootManager: RootManager
    @StateObject var vm: HomeViewModel
    
    var body: some View {
        BaseView(content: content)
    }
    
    @ViewBuilder private func content() -> some View {
        VStack {
            Text("Hola")
            Button {
                vm.soFunny()
            } label: {
                Text("Ho to go")
            }
        }
    }
}

#Preview {
    HomeWireframe(rootManager: RootManager()).preview()
}
