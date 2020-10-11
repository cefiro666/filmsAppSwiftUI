//
//  SpinnerView.swift
//  ModernMVVM
//
//  Created by Vadym Bulavin on 2/18/20.
//  Copyright © 2020 Vadym Bulavin. All rights reserved.
//

import SwiftUI
import UIKit

// MARK: - SpinnerView
struct SpinnerView: UIViewRepresentable {
    
// MARK: - Properties
    let isAnimating: Bool
    let style: UIActivityIndicatorView.Style

// MARK: - Methods
    func makeUIView(context: Context) -> UIActivityIndicatorView {
        let spinner = UIActivityIndicatorView(style: self.style)
        spinner.hidesWhenStopped = true
        return spinner
    }

    func updateUIView(_ uiView: UIActivityIndicatorView, context: Context) {
        self.isAnimating ? uiView.startAnimating() : uiView.stopAnimating()
    }
    
}
