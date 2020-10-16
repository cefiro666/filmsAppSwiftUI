//
//  TabBarConfiguratorTests.swift
//  FilmsAppSUITests
//
//  Created by Виталий Баник on 16.10.2020.
//  Copyright © 2020 Виталий Баник. All rights reserved.
//

import XCTest
@testable import FilmsAppSUI

class TabBarConfiguratorTests: XCTestCase {

    func testTabBarControllerReturnableGetTabBarFromTabBarItemTypeMatchStatedTabBarItem() {
        var createdControllers = [UIViewController]()
        
        let tabBarController = TabBarConfigurator.getTabBarFromTabBarItemType(Tab.self) { controllers in
            createdControllers = controllers
        }
        
        let firstTabController = tabBarController.viewControllers?.first
        
        XCTAssertEqual(firstTabController, createdControllers.first)
        XCTAssertEqual(firstTabController?.tabBarItem.title, Tab.oneTab.title)
        XCTAssertEqual(firstTabController?.tabBarItem.image, Tab.oneTab.image)
        XCTAssertEqual(firstTabController?.tabBarItem.selectedImage, Tab.oneTab.selectedImage)
    }
}

// MARK: - extensions
extension TabBarConfiguratorTests {
    
// MARK: - Tab
    enum Tab: Int, TabBarItem {
        
        case oneTab
        case twoTab

        var tabIndex: Int {
            return self.rawValue
        }
        
        var title: String {
            switch self {
            case .oneTab: return "oneTab"
            case .twoTab: return "twoTab"
            }
        }
        
        var image: UIImage? {
            switch self {
            case .oneTab: return UIImage()
            case .twoTab: return UIImage()
            }
        }
        
        var selectedImage: UIImage? {
            switch self {
            case .oneTab: return UIImage()
            case .twoTab: return UIImage()
            }
        }
        
        var controller: UIViewController? {
            switch self {
            case .oneTab: return TestModuleConfigurator.createScreen(configureBlock: nil)
            case .twoTab: return TestModuleConfigurator.createScreen(configureBlock: nil)
            }
        }
    }
    
}
