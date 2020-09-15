//
//  SceneDelegate.swift
//  FilmsAppSUI
//
//  Created by Виталий Баник on 28.08.2020.
//  Copyright © 2020 Виталий Баник. All rights reserved.
//

import UIKit
import SwiftUI

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    private static var _window:UIWindow?

    func scene(_ scene: UIScene,
               willConnectTo session: UISceneSession,
               options connectionOptions: UIScene.ConnectionOptions) {

        if let windowScene = scene as? UIWindowScene {
            let window = UIWindow(windowScene: windowScene)

            self.window = window
            SceneDelegate._window = self.window
            window.makeKeyAndVisible()
        }
        
        Navigator.shared.setRootController(screen: FilmsListView.self)
    }
    
    static func setupRoot(viewController: UIViewController) {
        _window?.rootViewController = viewController
    }

}

