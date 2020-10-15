//
//  SplashScreen.swift
//  filmsAppSwiftUI
//
//  Created by Виталий Баник on 15/10/2020.
//  Copyright © 2020 Sequenia. All rights reserved.
//

import Foundation

// MARK: - SplashScreenRouter
protocol SplashScreenRouter: Router {
    
    func showMainScreen()
}

// MARK: - SplashScreenRouterImpl
struct SplashScreenRouterImpl: SplashScreenRouter {
    
    func showMainScreen() {
        self.window?.rootViewController = TabBarConfigurator.getTabBarFromTabBarItemType(TabBarItemImpl.self)
    }
}

