//
//  Router.swift
//  FilmsAppSUI
//
//  Created by Виталий Баник on 10.10.2020.
//  Copyright © 2020 Виталий Баник. All rights reserved.
//

import UIKit
import SwiftUI

typealias Contentable = View & Configurable & Presentable

// MARK: - Router
protocol Router {
    
    var window: UIWindow? { get }
    var rootController: UIViewController? { get }
    var navigationController: UINavigationController? { get }
    var tabBarController: UITabBarController? { get }
    var presentedController: UIViewController? { get }
    
    @discardableResult func pushScreen<Content: Contentable>(
        view: Content.Type,
        title: String,
        configureBlock: ((Content.ConfiguratorType.Content?) -> ())?
    ) -> UIViewController?
    
    @discardableResult func pushScreenWithHidenTabBar<Content: Contentable>(
        view: Content.Type,
        title: String,
        configureBlock: ((Content.ConfiguratorType.Content?) -> ())?
    ) -> UIViewController?
    
    @discardableResult func presentScreenWithNavBar<Content: Contentable>(
        view: Content.Type,
        title: String,
        configureBlock: ((Content.ConfiguratorType.Content?) -> ())?
    ) -> UIViewController?
    
    @discardableResult func presentScreen<Content: Contentable>(
        view: Content.Type,
        configureBlock: ((Content.ConfiguratorType.Content?) -> ())?
    ) -> UIViewController?
    
    @discardableResult func getScreenWithNavBar<Content: Contentable>(
        view: Content.Type,
        title: String,
        configureBlock: ((Content.ConfiguratorType.Content?) -> ())?
    ) -> UIViewController?
    
    @discardableResult func getScreen<Content: Contentable>(
        view: Content.Type,
        configureBlock: ((Content.ConfiguratorType.Content?) -> ())?
    ) -> UIViewController?
    
    @discardableResult func setRootScreenWithNavBar<Content: Contentable>(
        view: Content.Type,
        title: String,
        configureBlock: ((Content.ConfiguratorType.Content?) -> ())?
    ) -> UIViewController?
    
    @discardableResult func setRootScreen<Content: Contentable>(
        view: Content.Type,
        configureBlock: ((Content.ConfiguratorType.Content?) -> ())?
    ) -> UIViewController?
    
    func popScreen()
    func dismissScreen(completion: (() -> ())?)
    func setTab<Item: TabBarItem & CaseIterable>(_ tab: Item)
}

// MARK: - Router default implementation
extension Router {

// MARK: - Properties
    var window: UIWindow? {
        return (UIApplication.shared.connectedScenes.first as? UIWindowScene)?.windows.first
    }
    
    var rootController: UIViewController? {
        return self.window?.rootViewController
    }
    
    var navigationController: UINavigationController? {
        let navigationController = (self.rootController as? UINavigationController) ??
            (self.tabBarController?.selectedViewController as? UINavigationController) ??
            (self.rootController?.presentedViewController as? UINavigationController)
            
        return navigationController
    }
    
    var tabBarController: UITabBarController? {
        return (self.rootController as? UITabBarController) ?? self.rootController?.tabBarController
    }
    
    var presentedController: UIViewController? {
        return self.rootController?.presentedViewController ?? self.rootController
    }
    
// MARK: - Methods
    @discardableResult func pushScreen<Content: Contentable>(
        view: Content.Type,
        title: String,
        configureBlock: ((Content.ConfiguratorType.Content?) -> ())?
    ) -> UIViewController? {
        
        let viewController = view.configurator.createScreen(configureBlock: configureBlock)
        viewController.title = title
        self.navigationController?.pushViewController(viewController, animated: true)
        return viewController
    }
    
    @discardableResult func pushScreenWithHidenTabBar<Content: Contentable>(
        view: Content.Type,
        title: String,
        configureBlock: ((Content.ConfiguratorType.Content?) -> ())?
    ) -> UIViewController? {
        
        let viewController = view.configurator.createScreen(configureBlock: configureBlock)
        viewController.title = title
        viewController.hidesBottomBarWhenPushed = true
        self.navigationController?.pushViewController(viewController, animated: true)
        return viewController
    }
    
    @discardableResult func presentScreenWithNavBar<Content: Contentable>(
        view: Content.Type,
        title: String,
        configureBlock: ((Content.ConfiguratorType.Content?) -> ())?
    ) -> UIViewController? {
        
        let viewController = view.configurator.createScreen(configureBlock: configureBlock)
        viewController.title = title
        let navigationController = UINavigationController(rootViewController: viewController)
        navigationController.modalPresentationStyle = .fullScreen
        self.rootController?.present(navigationController, animated: true)
        return navigationController
    }
    
    @discardableResult func presentScreen<Content: Contentable>(
        view: Content.Type,
        configureBlock: ((Content.ConfiguratorType.Content?) -> ())?
    ) -> UIViewController? {
        
        let viewController = view.configurator.createScreen(configureBlock: configureBlock)
        viewController.modalPresentationStyle = .fullScreen
        self.rootController?.present(viewController, animated: true)
        return viewController
    }
    
    @discardableResult func getScreenWithNavBar<Content: Contentable>(
        view: Content.Type,
        title: String,
        configureBlock: ((Content.ConfiguratorType.Content?) -> ())?
    ) -> UIViewController? {
        
        let viewController = view.configurator.createScreen(configureBlock: configureBlock)
        viewController.title = title
        let navigationController = UINavigationController(rootViewController: viewController)
        return navigationController
    }
    
    @discardableResult func getScreen<Content: Contentable>(
        view: Content.Type,
        configureBlock: ((Content.ConfiguratorType.Content?) -> ())?
    ) -> UIViewController? {
        
        return view.configurator.createScreen(configureBlock: configureBlock)
    }
    
    @discardableResult func setRootScreenWithNavBar<Content: Contentable>(
        view: Content.Type,
        title: String,
        configureBlock: ((Content.ConfiguratorType.Content?) -> ())?
    ) -> UIViewController? {
        
        let viewController = view.configurator.createScreen(configureBlock: configureBlock)
        viewController.title = title
        let navigationController = UINavigationController(rootViewController: viewController)
        self.window?.rootViewController = navigationController
        return navigationController
    }
    
    @discardableResult func setRootScreen<Content: Contentable>(
        view: Content.Type,
        configureBlock: ((Content.ConfiguratorType.Content?) -> ())?
    ) -> UIViewController? {
        
        let viewController = view.configurator.createScreen(configureBlock: configureBlock)
        self.window?.rootViewController = viewController
        return viewController
    }
    
    func popScreen() {
        self.navigationController?.popViewController(animated: true)
    }
    
    func dismissScreen(completion: (() -> ())? = nil) {
        self.presentedController?.dismiss(animated: true, completion: completion)
    }
    
    func setTab<Item: TabBarItem & CaseIterable>(_ tab: Item) {
        self.tabBarController?.selectedIndex = tab.tabIndex
    }
    
}
