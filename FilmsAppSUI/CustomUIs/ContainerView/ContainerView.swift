//
//  ContainerView.swift
//  FilmsAppSUI
//
//  Created by Виталий Баник on 07.09.2020.
//  Copyright © 2020 Виталий Баник. All rights reserved.
//

import SwiftUI

// MARK: - ContainerView
struct ContainerView<Content: Contentable>: View {
    
// MARK: - Presenter
    @ObservedObject var presenter = ContainerPresenter()
    
// MARK: - Content
    private let content: Content
    
// MARK: - Inits
    init(content: Content) {
        self.content = content
        self.content.presenter.container = self.presenter
    }
    
// MARK: - Body
    var body: some View {
        ZStack {
            self.content
            
            if self.presenter.isLoading {
                SpinnerView(style: .large)
            }
            
            if self.presenter.hasError {
                VStack {
                    Spacer()
                    
                    ErrorView(message: self.presenter.errorMessage) {
                        self.presenter.onClickError()
                        self.presenter.hasError = false
                    }
                    
                    .animation(.spring())
                }
                
                .padding(.bottom, 20.0)
            }
        }
    }
}
