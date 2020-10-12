//
//  ContainerView.swift
//  FilmsAppSUI
//
//  Created by Виталий Баник on 07.09.2020.
//  Copyright © 2020 Виталий Баник. All rights reserved.
//

import SwiftUI

// MARK: - ContainerView
struct ContainerView<Content: View & Presentable>: View {
    
// MARK: - Presenter
    @ObservedObject var presenter = ContainerPresenter()
    
// MARK: - Content
    private let content: Content
    
// MARK: - Inits
    init(content: Content) {
        self.content = content
        self.content.presenter.container = self.presenter
    }
    
// MARK: - body
    var body: some View {
        ZStack {
            self.content
            
            if self.presenter.isLoading {
                SpinnerView(isAnimating: true, style: .large)
            }

        }.alert(isPresented: self.$presenter.hasError) {
            Alert(title: Text(""),
                  message: Text(self.presenter.errorMessage),
                  dismissButton: .default(Text("repeat")) {
                    
                self.content.presenter.onClickError()
            })
        }
    }
}
