//
//  NavigatorTests.swift
//  FilmsAppSUITests
//
//  Created by Виталий Баник on 06.10.2020.
//  Copyright © 2020 Виталий Баник. All rights reserved.
//

import XCTest
@testable import FilmsAppSUI

// MARK: - Tab
enum Tab: Int, TabBarItem {
    
    case oneTab
    case twoTab
    // MARK: - Tab
    enum Tab: Int, TabBarItem {
        
        case oneTab
        case twoTab
        
        var tabIndex: Int {
            return self.rawValue
        }
    }
    var tabIndex: Int {
        return self.rawValue
    }
}

// MARK: - NavigatorTests
class NavigatorTests: XCTestCase {

    var testView: TestModuleView<TestModulePresenterImpl>!
    var mockSceneDelegate: UIWindowSceneDelegate?
    
    var statedController: UIViewController? {
        return self.mockSceneDelegate?.window??.rootViewController
    }
    
    override func setUpWithError() throws {
        self.testView = TestModuleView(presenter: TestModulePresenterImpl())
        self.mockSceneDelegate = MockSceneDelegate()
        Navigator.shared.setSceneDelegate(self.mockSceneDelegate)
    }

    override func tearDownWithError() throws {
        self.testView = nil
        self.mockSceneDelegate = nil
    }

    func testNavigatorAfterInitNotEqualByNil() throws {
        XCTAssertNotNil(Navigator.shared)
    }

    func testNavigatorIsSingleton() throws {
        let navigatorInstance = Navigator.shared
        let navigatorSomeInstance = Navigator.shared
        
        XCTAssertEqual(navigatorInstance, navigatorSomeInstance)
    }
    
    func testNavigatorAfterSetRootScreenRootControllerNotEqualByNil() throws {
        Navigator.shared.setRootScreen(view: self.testView, configureBlock: nil)
        
        XCTAssertNotNil(self.statedController)
    }
    
    func testNavigatorAfterSetRootScreenHasStatedScreen() throws {
        let controller = Navigator.shared.setRootScreen(view: self.testView, configureBlock: nil)
        
        XCTAssertEqual(controller, self.statedController)
    }
    
    func testNavigatorWhenSetRootScreenConfigureBlockWorking() throws {
        let testString = "Foo"
        Navigator.shared.setRootScreen(view: self.testView) { view in
            view?.presenter.setTestString(testString)
        }
        
        XCTAssertEqual(self.testView.presenter.data.testString, testString)
    }
    
    func testNavigatorAfterSetRootScreenWithNavBarRootControllerNotEqualByNil() throws {
        Navigator.shared.setRootScreenWithNavBar(view: self.testView, title: "Foo", configureBlock: nil)
        
        XCTAssertNotNil(self.statedController)
    }
    
    func testNavigatorAfterSetRootScreenWithNavBarHasStatedScreen() throws {
        let controller = Navigator.shared.setRootScreenWithNavBar(view: self.testView,
                                                                  title: "Foo",
                                                                  configureBlock: nil)
        
        XCTAssertEqual(controller, self.statedController)
    }
    
    func testNavigatorAfterSetRootScreenWithNavTitleEqualByStatedTitle() throws {
        let title = "Foo"
        Navigator.shared.setRootScreenWithNavBar(view: self.testView,
                                                 title: title,
                                                 configureBlock: nil)
        
        XCTAssertEqual(title, self.statedController?.title)
    }
    
    func testNavigatorWhenSetRootScreenWithNavBarConfigureBlockWorking() throws {
        let testString = "Foo"
        Navigator.shared.setRootScreenWithNavBar(view: self.testView,
                                                 title: "Foo") { view in
            view?.presenter.setTestString(testString)
        }
        
        XCTAssertEqual(self.testView.presenter.data.testString, testString)
    }
    
    func testNavigatorTabAfterSetTabEqualByStatedTab() throws {
        let tabBarController = UITabBarController()
        tabBarController.setViewControllers([UIViewController(), UIViewController()], animated: false)
        self.mockSceneDelegate?.window??.rootViewController = tabBarController
        
        Navigator.shared.setTab(Tab.oneTab)
     
        XCTAssertEqual(Navigator.shared.tabBarController?.selectedIndex, Tab.oneTab.tabIndex)
        
        Navigator.shared.setTab(Tab.twoTab)
     
        XCTAssertEqual(Navigator.shared.tabBarController?.selectedIndex, Tab.twoTab.tabIndex)
    }

}
