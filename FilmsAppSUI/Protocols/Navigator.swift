//
//  Navigator.swift
//  FilmsAppSUI
//
//  Created by Виталий Баник on 10.10.2020.
//  Copyright © 2020 Виталий Баник. All rights reserved.
//

import SwiftUI
import UIKit

// MARK: - Navigator
protocol Navigator {
    
    static var rootController: UIViewController? { get }
    static var navigationController: UINavigationController? { get }
    static var tabBarController: UITabBarController? { get }
    static var presentedController: UIViewController? { get }
    
    static var sceneDelegate: UIWindowSceneDelegate? { get set }
    
    @discardableResult static func pushScreen<Content: View & Configurable & Presentable>(
        view: Content,
        title: String,
        configureBlock: ((Content?) -> ())?
    ) -> UIViewController?
    
    @discardableResult static func pushScreenWithHidenTabBar<Content: View & Configurable & Presentable>(
        view: Content,
        title: String,
        configureBlock: ((Content?) -> ())?
    ) -> UIViewController?
    
    @discardableResult static func presentScreenWithNavBar<Content: View & Configurable & Presentable>(
        view: Content,
        title: String,
        configureBlock: ((Content?) -> ())?
    ) -> UIViewController?
    
    @discardableResult static func presentScreen<Content: View & Configurable & Presentable>(
        view: Content,
        configureBlock: ((Content?) -> ())?
    ) -> UIViewController?
    
    @discardableResult static func getScreenWithNavBar<Content: View & Configurable & Presentable>(
        view: Content,
        title: String,
        configureBlock: ((Content?) -> ())?
    ) -> UIViewController?
    
    @discardableResult static func getScreen<Content: View & Configurable & Presentable>(
        view: Content,
        configureBlock: ((Content?) -> ())?
    ) -> UIViewController?
    
    @discardableResult static func setRootScreenWithNavBar<Content: View & Configurable & Presentable>(
        view: Content,
        title: String,
        configureBlock: ((Content?) -> ())?
    ) -> UIViewController?
    
    @discardableResult static func setRootScreen<Content: View & Configurable & Presentable>(
        view: Content,
        configureBlock: ((Content?) -> ())?
    ) -> UIViewController?
    
    static func popScreen()
    static func dismissScreen(completion: (() -> ())?)
    static func configureTabsWithTabBarItemType<Item: TabBarItem & CaseIterable>(_ tabType: Item.Type)
    static func setTab<Item: TabBarItem & CaseIterable>(_ tab: Item)
}
