//
//  LottieView.swift
//  FilmsAppSUI
//
//  Created by Виталий Баник on 04.10.2020.
//  Copyright © 2020 Виталий Баник. All rights reserved.
//

import SwiftUI
import Lottie

// MARK: - LottieView
struct LottieView: UIViewRepresentable {
    
// MARK: - Properties
    var name: String
    var loopMode: LottieLoopMode = .playOnce
    var animationView = AnimationView()

// MARK: - Methods
    func makeUIView(context: UIViewRepresentableContext<LottieView>) -> UIView {
        let view = UIView()

        self.animationView.animation = Animation.named(self.name)
        self.animationView.contentMode = .scaleAspectFit
        self.animationView.loopMode = self.loopMode

        self.animationView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(self.animationView)

        NSLayoutConstraint.activate([
            self.animationView.widthAnchor.constraint(equalTo: view.widthAnchor),
            self.animationView.heightAnchor.constraint(equalTo: view.heightAnchor)
        ])

        return view
    }

    func updateUIView(_ uiView: UIView, context: UIViewRepresentableContext<LottieView>) {
        self.animationView.play()
    }
    
}
