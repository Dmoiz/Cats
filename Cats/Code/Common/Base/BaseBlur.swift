//
//  BaseBlur.swift
//  Cats
//
//  Created by Diego Moreno on 17/10/24.
//

import SwiftUI
import UIKit

struct BaseBlur: UIViewRepresentable {

    func makeUIView(context: Context) -> UIView {
        let view = UIView(frame: UIApplication.screenBounds)
        view.backgroundColor = .clear
        let blurEffect = UIBlurEffect(style: .dark) // Puedes cambiar el estilo aquí
        let blurView = UIVisualEffectView(effect: blurEffect)
        blurView.frame = view.bounds
        view.addSubview(blurView)

        return view
    }

    func updateUIView(_ uiView: UIView, context: Context) {
        // Actualiza la vista si es necesario
    }
}
