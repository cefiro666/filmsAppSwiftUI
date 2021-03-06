//
//  SceneDelegate.swift
//  FilmsAppSUI
//
//  Created by Виталий Баник on 28.08.2020.
//  Copyright © 2020 Виталий Баник. All rights reserved.
//

import UIKit
import SwiftUI

// MARK: SceneDelegate
class SceneDelegate: UIResponder, UIWindowSceneDelegate {

// MARK: Properties
    var window: UIWindow?

// MARK: Methods
    func scene(_ scene: UIScene,
               willConnectTo session: UISceneSession,
               options connectionOptions: UIScene.ConnectionOptions) {

        if let windowScene = scene as? UIWindowScene {
            let window = UIWindow(windowScene: windowScene)

            self.window = window
            window.makeKeyAndVisible()
        }
        
        self.configureUISystemPreferences()
        self.setInitialScreen()
    }
    
    private func configureUISystemPreferences() {
        UITableViewHeaderFooterView.appearance().tintColor = UIColor.clear
        UITableView.appearance().separatorStyle = .none
        UITableView.appearance().allowsSelection = false
        UITableViewCell.appearance().selectionStyle = .none
        UINavigationBar.appearance().isTranslucent = false
        UITabBar.appearance().tintColor = .systemBlue
        UITabBar.appearance().unselectedItemTintColor = .gray
    }
    
    public func setInitialScreen() {
        self.window?.rootViewController = SplashScreenConfigurator.createScreen(configureBlock: nil)
    }

}
