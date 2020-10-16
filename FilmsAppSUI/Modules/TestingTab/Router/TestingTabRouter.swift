//
//  TestingTab.swift
//  filmsAppSwiftUI
//
//  Created by Виталий Баник on 15/10/2020.
//  Copyright © 2020 Sequenia. All rights reserved.
//

import Foundation

// MARK: - TestingTabRouter
protocol TestingTabRouter: Router {
    
    func presentTestViewWithNavBar()
    func presentTestView()
    func pushTestViewWithHidenTabBar()
    func pushTestView()
}

// MARK: - TestingTabRouterImpl
struct TestingTabRouterImpl: TestingTabRouter {
    
    func presentTestViewWithNavBar() {
        self.presentScreenWithNavBar(view: PresentingView.self, title: "Presented view", configureBlock: nil)
    }
    
    func presentTestView() {
        self.presentScreen(view: PresentingView.self, configureBlock: nil)
    }
    
    func pushTestViewWithHidenTabBar() {
        self.pushScreenWithHidenTabBar(view: PushingView.self, title: "Pushed view", configureBlock: nil)
    }
    
    func pushTestView() {
        self.pushScreen(view: PushingView.self, title: "Pushed view", configureBlock: nil)
    }
}

