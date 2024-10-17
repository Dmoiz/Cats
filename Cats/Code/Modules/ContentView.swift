//
//  ContentView.swift
//  Cats
//
//  Created by Diego Moreno on 15/10/24.
//

import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject var rootManager: RootManager
    
    var body: some View {
        BaseView(content: content)
    }
    
    @ViewBuilder private func content() -> some View {
        VStack {
            Text("Hola")
            Button {
                rootManager.popToLast()
            } label: {
                Text("Ho to g 2 o")
            }
        }
    }
}

#Preview {
    ContentView()
}
