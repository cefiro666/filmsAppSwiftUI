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
    private static var currentWindow: UIWindow?

// MARK: Methods
    func scene(_ scene: UIScene,
               willConnectTo session: UISceneSession,
               options connectionOptions: UIScene.ConnectionOptions) {

        if let windowScene = scene as? UIWindowScene {
            let window = UIWindow(windowScene: windowScene)

            self.window = window
            SceneDelegate.currentWindow = self.window
            window.makeKeyAndVisible()
        }
        
        Navigator.shared.setRootController(view: FilmsListView(presenter: FilmsListPresenterImpl()),
                                           configureBlock: nil)
    }
    
    static func setupRoot(viewController: UIViewController) {
        SceneDelegate.currentWindow?.rootViewController = viewController
    }

}

