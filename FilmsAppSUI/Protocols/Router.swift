//
//  Router.swift
//  FilmsAppSUI
//
//  Created by Виталий Баник on 10.10.2020.
//  Copyright © 2020 Виталий Баник. All rights reserved.
//

import UIKit
import SwiftUI

// MARK: - Router
protocol Router {
    
    var rootController: UIViewController? { get }
    var navigationController: UINavigationController? { get }
    var tabBarController: UITabBarController? { get }
    var presentedController: UIViewController? { get }
    
    var sceneDelegate: UIWindowScene? { get }
    
    @discardableResult func pushScreen<Content: View & Configurable & Presentable>(
        view: Content,
        title: String,
        configureBlock: ((Content?) -> ())?
    ) -> UIViewController?
    
    @discardableResult func pushScreenWithHidenTabBar<Content: View & Configurable & Presentable>(
        view: Content,
        title: String,
        configureBlock: ((Content?) -> ())?
    ) -> UIViewController?
    
    @discardableResult func presentScreenWithNavBar<Content: View & Configurable & Presentable>(
        view: Content,
        title: String,
        configureBlock: ((Content?) -> ())?
    ) -> UIViewController?
    
    @discardableResult func presentScreen<Content: View & Configurable & Presentable>(
        view: Content,
        configureBlock: ((Content?) -> ())?
    ) -> UIViewController?
    
    @discardableResult func getScreenWithNavBar<Content: View & Configurable & Presentable>(
        view: Content,
        title: String,
        configureBlock: ((Content?) -> ())?
    ) -> UIViewController?
    
    @discardableResult func getScreen<Content: View & Configurable & Presentable>(
        view: Content,
        configureBlock: ((Content?) -> ())?
    ) -> UIViewController?
    
    @discardableResult func setRootScreenWithNavBar<Content: View & Configurable & Presentable>(
        view: Content,
        title: String,
        configureBlock: ((Content?) -> ())?
    ) -> UIViewController?
    
    @discardableResult func setRootScreen<Content: View & Configurable & Presentable>(
        view: Content,
        configureBlock: ((Content?) -> ())?
    ) -> UIViewController?
    
    func popScreen()
    func dismissScreen(completion: (() -> ())?)
    func setTab<Item: TabBarItem & CaseIterable>(_ tab: Item)
}

extension Router {

// MARK: - Properties
    public weak var rootController: UIViewController? {
        return self.sceneDelegate?.windows.first?.rootViewController
    }
    
    public weak var navigationController: UINavigationController? {
        let navigationController = (self.rootController as? UINavigationController) ??
            (self.tabBarController?.selectedViewController as? UINavigationController) ??
            self.rootController?.navigationController ??
            (self.rootController?.presentedViewController as? UINavigationController)
            
        return navigationController
    }
    
    public weak var tabBarController: UITabBarController? {
        return (self.rootController as? UITabBarController) ?? self.rootController?.tabBarController
    }
    
    public weak var presentedController: UIViewController? {
        return self.rootController?.presentedViewController
    }

// MARK: - Delegates
    weak var sceneDelegate: UIWindowScene? {
        return UIApplication.shared.connectedScenes.first as? UIWindowScene
    }
    
// MARK: - Methods
    @discardableResult public func pushScreen<Content: View & Configurable & Presentable>(
        view: Content,
        title: String,
        configureBlock: ((Content?) -> ())?
    ) -> UIViewController? {
        
        let viewController = view.configurator.createScreen(withView: view, configureBlock: configureBlock)
        viewController.title = title
        self.navigationController?.pushViewController(viewController, animated: true)
        return viewController
    }
    
    @discardableResult public func pushScreenWithHidenTabBar<Content: View & Configurable & Presentable>(
        view: Content,
        title: String,
        configureBlock: ((Content?) -> ())?
    ) -> UIViewController? {
        
        let viewController = view.configurator.createScreen(withView: view, configureBlock: configureBlock)
        viewController.title = title
        viewController.hidesBottomBarWhenPushed = true
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
        self.rootController?.present(navigationController, animated: true)
        return navigationController
    }
    
    @discardableResult public func presentScreen<Content: View & Configurable & Presentable>(
        view: Content,
        configureBlock: ((Content?) -> ())?
    ) -> UIViewController? {
        
        let viewController = view.configurator.createScreen(withView: view, configureBlock: configureBlock)
        viewController.modalPresentationStyle = .fullScreen
        self.rootController?.present(viewController, animated: true)
        return viewController
    }
    
    @discardableResult public func getScreenWithNavBar<Content: View & Configurable & Presentable>(
        view: Content,
        title: String,
        configureBlock: ((Content?) -> ())?
    ) -> UIViewController? {
        
        let viewController = view.configurator.createScreen(withView: view, configureBlock: configureBlock)
        viewController.title = title
        let navigationController = UINavigationController(rootViewController: viewController)
        return navigationController
    }
    
    @discardableResult public func getScreen<Content: View & Configurable & Presentable>(
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
        self.sceneDelegate?.windows.first?.rootViewController = navigationController
        return navigationController
    }
    
    @discardableResult public func setRootScreen<Content: View & Configurable & Presentable>(
        view: Content,
        configureBlock: ((Content?) -> ())?
    ) -> UIViewController? {
        
        let viewController = view.configurator.createScreen(withView: view, configureBlock: configureBlock)
        self.sceneDelegate?.windows.first?.rootViewController = viewController
        return viewController
    }
    
    public func popScreen() {
        if self.navigationController?.viewControllers.count == 1 {
            self.navigationController?.dismiss(animated: true)
        } else {
            self.navigationController?.popViewController(animated: true)
        }
    }
    
    public func dismissScreen(completion: (() -> ())? = nil) {
        self.navigationController?.dismiss(animated: true, completion: completion)
    }
    
    public func setTab<Item: TabBarItem & CaseIterable>(_ tab: Item) {
        self.tabBarController?.selectedIndex = tab.tabIndex
    }
    
}
