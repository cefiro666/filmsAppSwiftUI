//
//  ContainerView.swift
//  FilmsAppSUI
//
//  Created by Виталий Баник on 07.09.2020.
//  Copyright © 2020 Виталий Баник. All rights reserved.
//

import SwiftUI
import ImageViewerRemote

// MARK: - IContainer
protocol IContainer {
    
    func showErrorMessage(_ message: String?)
    func setLoadingVisible(_ visible: Bool)
}

// MARK: - ContainerView
struct ContainerView<Content: View&Modellable>: IContainer, View {
    
// MARK: - Properties
    @ObservedObject var containerModel = ContainerModel()
    private var content: Content
    
//    @State var needShowViewer: Bool = false
//    @State var urlString: String = "https://i.pinimg.com/originals/2d/dc/25/2ddc25914e2ae0db5311ffa41781dda1.jpg"
    
// MARK: - Inits
    init(content: Content) {
        self.content = content
        self.content.viewModel?.listener = self
    }
    
// MARK: - body
    var body: some View {
        ZStack {
            self.content
            if self.containerModel.isLoading {
                Text("load")
            }
        }.alert(isPresented: self.$containerModel.hasError) {
            Alert(title: Text(""),
                  message: Text(self.containerModel.errorMessage),
                  dismissButton: .default(Text("OK")) {
                    
            })
        }
//        }.overlay(ImageViewerRemote(imageURL: self.$urlString, viewerShown: self.$needShowViewer))
    }
    
    func showErrorMessage(_ message: String?) {
        self.containerModel.showErrorMessage(message)
    }
    
    func setLoadingVisible(_ visible: Bool) {
        self.containerModel.setLoadinVisible(visible)
    }
    
}
