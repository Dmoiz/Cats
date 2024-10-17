//
//  BaseView.swift
//  Cats
//
//  Created by Diego Moreno on 17/10/24.
//

import SwiftUI

struct BaseView<Content: View>: View {
    
    let content: () -> Content
    
    var body: some View {
        ZStack {
            content()
        }
        .onTapGesture {
            hideKeyboard()
        }
    }
}
