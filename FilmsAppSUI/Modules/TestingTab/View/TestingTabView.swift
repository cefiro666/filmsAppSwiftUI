//
//  TestingTab.swift
//  filmsAppSwiftUI
//
//  Created by Виталий Баник on 15/10/2020.
//  Copyright © 2020 Sequenia. All rights reserved.
//

import SwiftUI

// MARK: - TestingTabView
struct TestingTabView: Contentable {

// MARK: - Properties
    @ObservedObject var presenter = TestingTabPresenterImpl()
    static let configurator = TestingTabConfigurator.self

// MARK: - Body
    var body: some View {
        VStack {
            Text("Here are the main navigation features. \nTest it out!")
                .multilineTextAlignment(.center)
                .padding()
            
            ScrollView(.vertical, showsIndicators: true) {
                VStack(spacing: 15.0) {
                    Button("Present with navigation bar") {
                        self.presenter.onClickPresentWithNavBar()
                    }
                    
                    Button("Present") {
                        self.presenter.onClickPresent()
                    }
                    
                    Button("Push with hiden tab bar") {
                        self.presenter.onClickPushWithHidenTabBar()
                    }
                    
                    Button("Push") {
                        self.presenter.onClickPush()
                    }
                }
            }
            
            .padding()
        }
    }
}

// MARK: - PreviewProvider
struct TestingTab_Previews: PreviewProvider {
    
    static var previews: some View {
        TestingTabView()
    }
}
