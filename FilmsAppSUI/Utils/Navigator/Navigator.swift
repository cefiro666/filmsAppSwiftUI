//
//  Navigator.swift
//  FilmsAppSUI
//
//  Created by Виталий Баник on 28.08.2020.
//  Copyright © 2020 Виталий Баник. All rights reserved.
//

import SwiftUI
import UIKit

// MARK: - Navigator
class Navigator {
    
// MARK: - Singletone
    static let shared = Navigator()
    private init() {}
    
// MARK: - Properties
    weak var navigationController: UINavigationController? {
        if let scene = UIApplication.shared.connectedScenes.first,
            let sceneDelegate = scene as? UIWindowScene,
            let rootViewController = sceneDelegate.windows.first?.rootViewController {
            
            if rootViewController is UINavigationController  {
                return rootViewController as? UINavigationController
            } else {
                return rootViewController.navigationController
            }
        }
        
        return self.view?.navigationController
    }
    
    private weak var view: UIViewController?
    
// MARK: - Methods
    func setup(view: UIViewController) {
        self.view = view
    }
    
    func push<Content: View>(screen: Content.Type, title: String, data: Any? = nil) {
        if let viewController = ModuleConfig.config(screen: screen)?.createScreen(data) {
            viewController.title = title
            self.navigationController?.pushViewController(viewController, animated: true)
        }
    }
    
    func present<Content: View>(screen: Content.Type, title: String, data: Any? = nil) {
        if let viewController = ModuleConfig.config(screen: screen)?.createScreen(data) {
            viewController.title = title
            self.navigationController?.present(UINavigationController(rootViewController: viewController),
                                               animated: true,
                                               completion: nil)
        }
    }
    
    func get<Content: View>(screen: Content.Type, data: Any? = nil) -> UIViewController? {
        return ModuleConfig.config(screen: screen)?.createScreen(data)
    }
    
    func setRootController<Content:View>(screen: Content.Type, data: Any? = nil) {
        if let viewController = ModuleConfig.config(screen: screen)?.createScreen(data) {
            let navigationController = UINavigationController(rootViewController: viewController)
            navigationController.isNavigationBarHidden = true
            navigationController.navigationBar.prefersLargeTitles = true
            SceneDelegate.setupRoot(viewController: navigationController)
        }
    }
    
    func pop() {
        if self.navigationController?.viewControllers.count == 1 {
            self.navigationController?.dismiss(animated: true)
        } else {
            self.navigationController?.popViewController(animated: true)
        }
    }
    
    
    func dismiss(completion: (() -> ())? = nil) {
        self.navigationController?.dismiss(animated: true, completion: completion)
    }
    
}
