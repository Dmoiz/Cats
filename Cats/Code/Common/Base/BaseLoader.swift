//
//  BaseLoader.swift
//  Cats
//
//  Created by Diego Moreno on 17/10/24.
//

import SwiftUI


import SwiftUI

struct BaseLoader: View {
    @State var backOpacity: CGFloat = 0.3

    var body: some View {
        ZStack {
            BaseBlur().opacity(backOpacity).ignoresSafeArea()
            VStack {
                progressBar()
            }
        }
        .onAppear {
            withAnimation {
                backOpacity = 0.9
            }
        }
    }

    @ViewBuilder private func progressBar() -> some View {
        ProgressView()
            .progressViewStyle(CircularProgressViewStyle(tint: Color.white))
            .scaleEffect(2)
    }
}

#Preview {
    BaseLoader()
}
