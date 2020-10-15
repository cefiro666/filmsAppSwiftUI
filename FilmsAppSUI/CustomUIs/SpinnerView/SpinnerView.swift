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
    var style: UIActivityIndicatorView.Style
    var color: UIColor?
    
    init(style: UIActivityIndicatorView.Style, color: UIColor? = nil) {
        self.style = style
        self.color = color
    }

// MARK: - Methods
    func makeUIView(context: Context) -> UIActivityIndicatorView {
        let spinner = UIActivityIndicatorView(style: self.style)
        spinner.hidesWhenStopped = true
        
        if let color = self.color {
            spinner.color = color
        }
        
        spinner.startAnimating()
        return spinner
    }

    func updateUIView(_ uiView: UIActivityIndicatorView, context: Context) {
        
    }
    
}
