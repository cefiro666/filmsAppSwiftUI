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
    
// MARK: - Singletone
    static var shared = Navigator()
    private override init() {}

// MARK: - Setup methods
    func setSceneDelegate(_ delegate: UIWindowSceneDelegate?) {
        self.sceneDelegate = delegate
    }
    
// MARK: - Public properties
    public weak var rootController: UIViewController? {
        return self.sceneDelegate?.window??.rootViewController
    }
    
    public weak var navigationController: UINavigationController? {
        let navigationController = (self.rootController as? UINavigationController) ??
            (self.tabBarController?.selectedViewController as? UINavigationController) ??
            self.rootController?.navigationController ??
            (self.rootController?.presentedViewController as? UINavigationController)
            
        navigationController?.delegate = self
        return navigationController
    }
    
    public weak var tabBarController: UITabBarController? {
        return (self.rootController as? UITabBarController) ?? self.rootController?.tabBarController
    }

// MARK: - Private properties
    private var completion: (() -> ())?
    private weak var sceneDelegate: UIWindowSceneDelegate?
    
// MARK: - Public methods
    @discardableResult public func pushScreen<Content: View & Configurable & Presentable>(
        view: Content,
        title: String,
        needHideTabBar: Bool = true,
        configureBlock: ((Content?) -> ())?
    ) -> UIViewController? {
        
        let viewController = view.configurator.createScreen(withView: view, configureBlock: configureBlock)
        viewController.title = title
        viewController.hidesBottomBarWhenPushed = needHideTabBar
        self.navigationController?.pushViewController(viewController, animated: true)
        return viewController
    }
    
    @discardableResult public func presentScreenWithNavBar<Content: View & Configurable & Presentable>(
        view: Content,
        title: String,
        configureBlock: ((Content?) -> ())?
    ) -> UIViewController? {
        
        let viewController = view.configurator.createScreen(withView: view, configureBlock: configureBlock)
        viewController.title = title
        let navigationController = UINavigationController(rootViewController: viewController)
        navigationController.modalPresentationStyle = .fullScreen
        self.rootController?.present(navigationController, animated: true, completion: nil)
        return navigationController
    }
    
    @discardableResult public func presentScreen<Content: View & Configurable & Presentable>(
        view: Content,
        completion: (() ->())? = nil,
        configureBlock: ((Content?) -> ())?
    ) -> UIViewController? {
        
        let viewController = view.configurator.createScreen(withView: view, configureBlock: configureBlock)
        viewController.modalPresentationStyle = .fullScreen
        self.rootController?.present(viewController, animated: true, completion: completion)
        return viewController
    }
    
    public func getScreenWithNavBar<Content: View & Configurable & Presentable>(
        view: Content,
        title: String,
        configureBlock: ((Content?) -> ())?
    ) -> UIViewController? {
        
        let viewController = view.configurator.createScreen(withView: view, configureBlock: configureBlock)
        viewController.title = title
        let navigationController = UINavigationController(rootViewController: viewController)
        return navigationController
    }
    
    public func getScreen<Content: View & Configurable & Presentable>(
        view: Content,
        configureBlock: ((Content?) -> ())?
    ) -> UIViewController? {
        
        return view.configurator.createScreen(withView: view, configureBlock: configureBlock)
    }
    
    @discardableResult public func setRootScreenWithNavBar<Content: View & Configurable & Presentable>(
        view: Content,
        title: String,
        configureBlock: ((Content?) -> ())?
    ) -> UIViewController? {
        
        let viewController = view.configurator.createScreen(withView: view, configureBlock: configureBlock)
        viewController.title = title
        let navigationController = UINavigationController(rootViewController: viewController)
        navigationController.isNavigationBarHidden = true
        self.sceneDelegate?.window??.rootViewController = navigationController
        return navigationController
    }
    
    @discardableResult public func setRootScreen<Content: View & Configurable & Presentable>(
        view: Content,
        configureBlock: ((Content?) -> ())?
    ) -> UIViewController? {
        
        let viewController = view.configurator.createScreen(withView: view, configureBlock: configureBlock)
        self.sceneDelegate?.window??.rootViewController = viewController
        return viewController
    }
    
    public func popScreen(completion: (() -> ())? = nil) {
        if self.navigationController?.viewControllers.count == 1 {
            self.navigationController?.dismiss(animated: true, completion: completion)
        } else {
            self.completion = completion
            self.navigationController?.popViewController(animated: true)
        }
    }
    
    public func dismissScreen(completion: (() -> ())? = nil) {
        self.navigationController?.dismiss(animated: true, completion: completion)
    }
    
    public func setTab(_ tab: TabBarItem) {
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
