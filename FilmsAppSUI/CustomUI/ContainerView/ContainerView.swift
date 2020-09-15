//
//  ContainerView.swift
//  FilmsAppSUI
//
//  Created by Виталий Баник on 07.09.2020.
//  Copyright © 2020 Виталий Баник. All rights reserved.
//

import SwiftUI

// MARK: - IContainer
protocol IContainer {
    
    func showErrorMessage(_ message: String?)
    func setLoadingVisible(_ visible: Bool)
}

// MARK: - ContainerView
struct ContainerView<Content: View&Presentable>: View {
    
// MARK: - Properties
    @ObservedObject var presenter = ContainerPresenter()
    private var content: Content
    
// MARK: - Inits
    init(content: Content) {
        self.content = content
        self.content.iPresenter?.listener = self
    }
    
// MARK: - body
    var body: some View {
        ZStack {
            self.content
            SpinnerView(isAnimating: self.presenter.isLoading, style: .large)

        }.alert(isPresented: self.$presenter.hasError) {
            Alert(title: Text(""),
                  message: Text(self.presenter.errorMessage),
                  dismissButton: .default(Text("repeat")) {
                    
                self.content.iPresenter?.onClickError()
            })
        }
    }
    
}

// MARK: - IContainer
extension ContainerView: IContainer {
    
    func showErrorMessage(_ message: String?) {
        self.presenter.showErrorMessage(message)
    }
    
    func setLoadingVisible(_ visible: Bool) {
        self.presenter.setLoadinVisible(visible)
    }
}
