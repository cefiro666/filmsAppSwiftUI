//
//  NavigatorImpl.swift
//  FilmsAppSUI
//
//  Created by Виталий Баник on 28.08.2020.
//  Copyright © 2020 Виталий Баник. All rights reserved.
//

import SwiftUI
import UIKit

// MARK: - NavigatorImpl
class NavigatorImpl: Navigator {
    
// MARK: - Properties
    static public weak var rootController: UIViewController? {
        return NavigatorImpl.sceneDelegate?.window??.rootViewController
    }
    
    static public weak var navigationController: UINavigationController? {
        let navigationController = (NavigatorImpl.rootController as? UINavigationController) ??
            (NavigatorImpl.tabBarController?.selectedViewController as? UINavigationController) ??
            NavigatorImpl.rootController?.navigationController ??
            (NavigatorImpl.rootController?.presentedViewController as? UINavigationController)
            
        return navigationController
    }
    
    static public weak var tabBarController: UITabBarController? {
        return (self.rootController as? UITabBarController) ?? self.rootController?.tabBarController
    }
    
    static public weak var presentedController: UIViewController? {
        return self.rootController?.presentedViewController
    }

// MARK: - Delegates
    static weak var sceneDelegate: UIWindowSceneDelegate?
    
// MARK: - Methods
    @discardableResult static public func pushScreen<Content: View & Configurable & Presentable>(
        view: Content,
        title: String,
        configureBlock: ((Content?) -> ())?
    ) -> UIViewController? {
        
        let viewController = view.configurator.createScreen(withView: view, configureBlock: configureBlock)
        viewController.title = title
        NavigatorImpl.navigationController?.pushViewController(viewController, animated: true)
        return viewController
    }
    
    @discardableResult static public func pushScreenWithHidenTabBar<Content: View & Configurable & Presentable>(
        view: Content,
        title: String,
        configureBlock: ((Content?) -> ())?
    ) -> UIViewController? {
        
        let viewController = view.configurator.createScreen(withView: view, configureBlock: configureBlock)
        viewController.title = title
        viewController.hidesBottomBarWhenPushed = true
        NavigatorImpl.navigationController?.pushViewController(viewController, animated: true)
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
        NavigatorImpl.rootController?.present(navigationController, animated: true)
        return navigationController
    }
    
    @discardableResult static public func presentScreen<Content: View & Configurable & Presentable>(
        view: Content,
        configureBlock: ((Content?) -> ())?
    ) -> UIViewController? {
        
        let viewController = view.configurator.createScreen(withView: view, configureBlock: configureBlock)
        viewController.modalPresentationStyle = .fullScreen
        NavigatorImpl.rootController?.present(viewController, animated: true)
        return viewController
    }
    
    @discardableResult static public func getScreenWithNavBar<Content: View & Configurable & Presentable>(
        view: Content,
        title: String,
        configureBlock: ((Content?) -> ())?
    ) -> UIViewController? {
        
        let viewController = view.configurator.createScreen(withView: view, configureBlock: configureBlock)
        viewController.title = title
        let navigationController = UINavigationController(rootViewController: viewController)
        return navigationController
    }
    
    @discardableResult static public func getScreen<Content: View & Configurable & Presentable>(
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
        NavigatorImpl.sceneDelegate?.window??.rootViewController = navigationController
        return navigationController
    }
    
    @discardableResult static public func setRootScreen<Content: View & Configurable & Presentable>(
        view: Content,
        configureBlock: ((Content?) -> ())?
    ) -> UIViewController? {
        
        let viewController = view.configurator.createScreen(withView: view, configureBlock: configureBlock)
        NavigatorImpl.sceneDelegate?.window??.rootViewController = viewController
        return viewController
    }
    
    static public func popScreen() {
        if NavigatorImpl.navigationController?.viewControllers.count == 1 {
            NavigatorImpl.navigationController?.dismiss(animated: true)
        } else {
            NavigatorImpl.navigationController?.popViewController(animated: true)
        }
    }
    
    static public func dismissScreen(completion: (() -> ())? = nil) {
        NavigatorImpl.navigationController?.dismiss(animated: true, completion: completion)
    }
    
    static public func configureTabsWithTabBarItemType<TabItem: TabBarItem & CaseIterable>(_ tabType: TabItem.Type) {
        let tabBarController = UITabBarController()
        var controllers = [UIViewController]()
        
        for tabBarItem in tabType.allCases {
            if let controller = tabBarItem.controller {
                controller.tabBarItem = UITabBarItem(title: tabBarItem.title,
                                                     image: tabBarItem.image,
                                                     selectedImage: tabBarItem.selectedImage)
                controllers.append(controller)
            }
        }
        
        tabBarController.setViewControllers(controllers, animated: false)
        
        self.sceneDelegate?.window??.rootViewController = tabBarController
    }
    
    static public func setTab<TabItem: TabBarItem & CaseIterable>(_ tab: TabItem) {
        NavigatorImpl.tabBarController?.selectedIndex = tab.tabIndex
    }

}
