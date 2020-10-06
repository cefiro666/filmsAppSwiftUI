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
        let navigationController = (self.rootController as? UINavigationController) ??
            (self.tabBarController?.selectedViewController as? UINavigationController) ??
            self.rootController?.navigationController ??
            (self.rootController?.presentedViewController as? UINavigationController)
            
        navigationController?.delegate = self
        return navigationController
    }
    
    weak var tabBarController: UITabBarController? {
        return (self.rootController as? UITabBarController) ?? self.rootController?.tabBarController
    }

    private var completion: (() -> ())?
    
// MARK: - Methods
    func push<Content: View & Configurable & Presentable>(view: Content,
                                                          title: String,
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
        let navigationController = UINavigationController(rootViewController: viewController)
        navigationController.modalPresentationStyle = .fullScreen
        self.rootController?.present(navigationController, animated: true, completion: nil)
    }
    
    func present<Content: View & Configurable & Presentable>(view: Content,
                                                             configureBlock: ((Content?) -> ())?) {
        let viewController = view.configurator.createScreen(withView: view, configureBlock: configureBlock)
        viewController.modalPresentationStyle = .fullScreen
        self.rootController?.present(viewController, animated: true, completion: nil)
    }
    
    func getScreenWithNavBar<Content: View & Configurable & Presentable>(view: Content,
                                                                         configureBlock: ((Content?) -> ())?) -> UIViewController? {
        let viewController = view.configurator.createScreen(withView: view, configureBlock: configureBlock)
        let navigationController = UINavigationController(rootViewController: viewController)
        return navigationController
    }
    
    func getScreen<Content: View & Configurable & Presentable>(view: Content,
                                                               configureBlock: ((Content?) -> ())?) -> UIViewController? {
        return view.configurator.createScreen(withView: view, configureBlock: configureBlock)
    }
    
    func setRootControllerWithNavBar<Content: View & Configurable & Presentable>(view: Content,
                                                                                 title: String,
                                                                                 configureBlock: ((Content?) -> ())?) {
        let viewController = view.configurator.createScreen(withView: view, configureBlock: configureBlock)
        viewController.title = title
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
        self.tabBarController?.selectedIndex = tab.tabIndex
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
