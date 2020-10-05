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
class Navigator: NSObject {
    
// MARK: - Shared
    static var shared = Navigator()
    private override init() {}
    
// MARK: - Properties
    weak var rootController: UIViewController? {
        if let scene = UIApplication.shared.connectedScenes.first,
           let sceneDelegate = scene as? UIWindowScene,
           let rootViewController = sceneDelegate.windows.first?.rootViewController {
            
            return rootViewController
        }
        
        return nil
    }
    
    weak var navigationController: UINavigationController? {
        if let rootController = self.rootController {
            
            let navigationController = (rootController as? UINavigationController) ??
                (self.tabBarController?.selectedViewController as? UINavigationController) ??
                rootController.navigationController
                
            navigationController?.delegate = self
            return navigationController
        }
        
        return nil
    }
    
    weak var tabBarController: UITabBarController? {
        if let rootController = self.rootController {
            
            let tabBarController = (rootController as? UITabBarController) ?? rootController.tabBarController
            return tabBarController
        }
        
        return nil
    }

    private var completion: (() -> ())?
    
// MARK: - Methods
    func push<Content: View & Configurable & Presentable>(view: Content, title: String,
                                                          configureBlock: ((Content?) -> ())?) {
        let viewController = view.configurator.createScreen(withView: view, configureBlock: configureBlock)
        viewController.title = title
        self.navigationController?.pushViewController(viewController, animated: true)
    }
    
    func presentWithNavBar<Content: View & Configurable & Presentable>(view: Content,
                                                                       title: String,
                                                                       configureBlock: ((Content?) -> ())?) {
        let viewController = view.configurator.createScreen(withView: view, configureBlock: configureBlock)
        viewController.title = title
        self.navigationController?.present(UINavigationController(rootViewController: viewController),
                                           animated: true, completion: nil)
    }
    
    func present<Content: View & Configurable & Presentable>(view: Content,
                                                             configureBlock: ((Content?) -> ())?) {
        let viewController = view.configurator.createScreen(withView: view, configureBlock: configureBlock)
        self.rootController?.present(viewController, animated: true, completion: nil)
    }
    
    func getScreen<Content: View & Configurable & Presentable>(view: Content,
                                                               configureBlock: ((Content?) -> ())?) -> UIViewController? {
        return view.configurator.createScreen(withView: view, configureBlock: configureBlock)
    }
    
    func getScreenWithNavBar<Content: View & Configurable & Presentable>(view: Content,
                                                                         configureBlock: ((Content?) -> ())?) -> UIViewController? {
        let viewController = view.configurator.createScreen(withView: view, configureBlock: configureBlock)
        let navigationController = UINavigationController(rootViewController: viewController)
        return navigationController
    }
    
    func setRootControllerWithNavBar<Content: View & Configurable & Presentable>(view: Content,
                                                                                 configureBlock: ((Content?) -> ())?) {
        let viewController = view.configurator.createScreen(withView: view, configureBlock: configureBlock)
        let navigationController = UINavigationController(rootViewController: viewController)
        navigationController.isNavigationBarHidden = true
        SceneDelegate.setupRoot(viewController: navigationController)
    }
    
    func setRootController<Content: View & Configurable & Presentable>(view: Content,
                                                                       configureBlock: ((Content?) -> ())?) {
        let viewController = view.configurator.createScreen(withView: view, configureBlock: configureBlock)
        SceneDelegate.setupRoot(viewController: viewController)
    }
    
    func pop(completion: (() -> ())? = nil) {
        if self.navigationController?.viewControllers.count == 1 {
            self.navigationController?.dismiss(animated: true, completion: completion)
        } else {
            self.completion = completion
            self.navigationController?.popViewController(animated: true)
        }
    }
    
    func dismiss(completion: (() -> ())? = nil) {
        self.navigationController?.dismiss(animated: true, completion: completion)
    }
    
    func setTab(_ tab: TabBarItem) {
        self.tabBarController?.selectedIndex = tab.rawValue
    }

}

// MARK: - UINavigationControllerDelegate
extension Navigator: UINavigationControllerDelegate {
    
    public func navigationController(_ navigationController: UINavigationController,
                                     didShow viewController: UIViewController,
                                     animated: Bool) {
        DispatchQueue.main.async(execute: {
            self.completion?()
            self.completion = nil
        })
    }
    
}
