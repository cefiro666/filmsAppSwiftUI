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
    
// MARK: - Public properties
    static public weak var rootController: UIViewController? {
        return Navigator.sceneDelegate?.window??.rootViewController
    }
    
    static public weak var navigationController: UINavigationController? {
        let navigationController = (Navigator.rootController as? UINavigationController) ??
            (Navigator.tabBarController?.selectedViewController as? UINavigationController) ??
            Navigator.rootController?.navigationController ??
            (Navigator.rootController?.presentedViewController as? UINavigationController)
            
        return navigationController
    }
    
    static public weak var tabBarController: UITabBarController? {
        return (self.rootController as? UITabBarController) ?? self.rootController?.tabBarController
    }
    
    static public weak var presentedController: UIViewController? {
        return self.rootController?.presentedViewController
    }

// MARK: - Private properties
    static weak var sceneDelegate: UIWindowSceneDelegate?
    
// MARK: - Public methods
    @discardableResult static public func pushScreen<Content: View & Configurable & Presentable>(
        view: Content,
        title: String,
        needHideTabBar: Bool = true,
        configureBlock: ((Content?) -> ())?
    ) -> UIViewController? {
        
        let viewController = view.configurator.createScreen(withView: view, configureBlock: configureBlock)
        viewController.title = title
        viewController.hidesBottomBarWhenPushed = needHideTabBar
        Navigator.navigationController?.pushViewController(viewController, animated: true)
        return viewController
    }
    
    @discardableResult static public func presentScreenWithNavBar<Content: View & Configurable & Presentable>(
        view: Content,
        title: String,
        configureBlock: ((Content?) -> ())?
    ) -> UIViewController? {
        
        let viewController = view.configurator.createScreen(withView: view, configureBlock: configureBlock)
        viewController.title = title
        let navigationController = UINavigationController(rootViewController: viewController)
        navigationController.modalPresentationStyle = .fullScreen
        Navigator.rootController?.present(navigationController, animated: true)
        return navigationController
    }
    
    @discardableResult static public func presentScreen<Content: View & Configurable & Presentable>(
        view: Content,
        configureBlock: ((Content?) -> ())?
    ) -> UIViewController? {
        
        let viewController = view.configurator.createScreen(withView: view, configureBlock: configureBlock)
        viewController.modalPresentationStyle = .fullScreen
        Navigator.rootController?.present(viewController, animated: true)
        return viewController
    }
    
    static public func getScreenWithNavBar<Content: View & Configurable & Presentable>(
        view: Content,
        title: String,
        configureBlock: ((Content?) -> ())?
    ) -> UIViewController? {
        
        let viewController = view.configurator.createScreen(withView: view, configureBlock: configureBlock)
        viewController.title = title
        let navigationController = UINavigationController(rootViewController: viewController)
        return navigationController
    }
    
    static public func getScreen<Content: View & Configurable & Presentable>(
        view: Content,
        configureBlock: ((Content?) -> ())?
    ) -> UIViewController? {
        
        return view.configurator.createScreen(withView: view, configureBlock: configureBlock)
    }
    
    @discardableResult static public func setRootScreenWithNavBar<Content: View & Configurable & Presentable>(
        view: Content,
        title: String,
        configureBlock: ((Content?) -> ())?
    ) -> UIViewController? {
        
        let viewController = view.configurator.createScreen(withView: view, configureBlock: configureBlock)
        viewController.title = title
        let navigationController = UINavigationController(rootViewController: viewController)
        navigationController.isNavigationBarHidden = true
        Navigator.sceneDelegate?.window??.rootViewController = navigationController
        return navigationController
    }
    
    @discardableResult static public func setRootScreen<Content: View & Configurable & Presentable>(
        view: Content,
        configureBlock: ((Content?) -> ())?
    ) -> UIViewController? {
        
        let viewController = view.configurator.createScreen(withView: view, configureBlock: configureBlock)
        Navigator.sceneDelegate?.window??.rootViewController = viewController
        return viewController
    }
    
    static func popScreen() {
        if Navigator.navigationController?.viewControllers.count == 1 {
            Navigator.navigationController?.dismiss(animated: true)
        } else {
            Navigator.navigationController?.popViewController(animated: true)
        }
    }
    
    static public func dismissScreen(completion: (() -> ())? = nil) {
        Navigator.navigationController?.dismiss(animated: true, completion: completion)
    }
    
    static public func setTab(_ tab: TabBarItem) {
        Navigator.tabBarController?.selectedIndex = tab.tabIndex
    }

}
