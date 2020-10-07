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

    var tabIndex: Int {
        return self.rawValue
    }
}

// MARK: - NavigatorTests
class NavigatorTests: XCTestCase {

// MARK: - Properties
    var testView: TestModuleView<TestModulePresenterImpl>!
    var mockSceneDelegate: UIWindowSceneDelegate?
    
    var rootController: UIViewController? {
        return self.mockSceneDelegate?.window??.rootViewController
    }
    
// MARK: - Setup and tear down
    override func setUpWithError() throws {
        self.testView = TestModuleView(presenter: TestModulePresenterImpl())
        self.mockSceneDelegate = MockSceneDelegate()
        Navigator.setSceneDelegate(self.mockSceneDelegate)
    }

    override func tearDownWithError() throws {
        self.testView = nil
        self.mockSceneDelegate = nil
    }
    
    func testRootControllerAfterSetRootScreenNotEqualByNil() throws {
        Navigator.setRootScreen(view: self.testView, configureBlock: nil)
        
        XCTAssertNotNil(self.rootController)
    }
    
    func testRootControllerAfterSetRootScreenEqualByStatedScreen() throws {
        let controller = Navigator.setRootScreen(view: self.testView, configureBlock: nil)
        
        XCTAssertEqual(controller, self.rootController)
    }
    
    func testConfigureBlockWhenSetRootScreenkWorking() throws {
        Navigator.setRootScreen(view: self.testView) { view in
            view?.presenter.setTestString("Foo")
        }
        
        XCTAssertEqual(self.testView.presenter.data.testString, "Foo")
    }
    
    func testRootControllerAfterSetRootScreenWithNavBarNotEqualByNil() throws {
        Navigator.setRootScreenWithNavBar(view: self.testView, title: "Foo", configureBlock: nil)
        
        XCTAssertNotNil(self.rootController)
    }
    
    func testRootControllerAfterSetRootScreenWithNavBarEqualByStatedScreen() throws {
        let controller = Navigator.setRootScreenWithNavBar(view: self.testView,
                                                           title: "Foo",
                                                           configureBlock: nil)
        
        XCTAssertEqual(controller, self.rootController)
    }
    
    func testRootControllerTitleAfterSetRootScreenWithNavBarEqualByStatedTitle() throws {
        Navigator.setRootScreenWithNavBar(view: self.testView,
                                          title: "Foo",
                                          configureBlock: nil)
        
        XCTAssertEqual("Foo", self.rootController?.title)
    }
    
    func testConfigureBlockWhenSetRootScreenWithNavBarWorking() throws {
        Navigator.setRootScreenWithNavBar(view: self.testView, title: "Foo") { view in
            view?.presenter.setTestString("Bar")
        }
        
        XCTAssertEqual(self.testView.presenter.data.testString, "Bar")
    }
    
    func testSelectedTabAfterSetTabEqualByStatedTab() throws {
        self.tabControllerWasTuned()
        
        Navigator.setTab(Tab.oneTab)
     
        XCTAssertEqual(Navigator.tabBarController?.selectedIndex, Tab.oneTab.tabIndex)
        
        Navigator.setTab(Tab.twoTab)
     
        XCTAssertEqual(Navigator.tabBarController?.selectedIndex, Tab.twoTab.tabIndex)
    }
    
    private func tabControllerWasTuned() {
        let tabBarController = UITabBarController()
        tabBarController.setViewControllers([UIViewController(), UIViewController()], animated: false)
        self.mockSceneDelegate?.window??.rootViewController = tabBarController
    }
    
    func testRootControllerAfterPresentScreenEqualPresentedScreen() throws {
        Navigator.setRootScreen(view: self.testView, configureBlock: nil)
        
        self.presentScreenAndWaitCancelTransitionAnimation { presentedController in
            XCTAssertEqual(Navigator.presentedController, presentedController)
        }
    }
    
    private func presentScreenAndWaitCancelTransitionAnimation(_ animationCompletion: @escaping (UIViewController?) -> ()) {
        let someView = TestModuleView(presenter: TestModulePresenterImpl())
        let presentedController = Navigator.presentScreen(view: someView, configureBlock: nil)
        
        let exp = self.expectation(description: "Test Navigator.shared.presentScreen method")
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            exp.fulfill()
        }

        waitForExpectations(timeout: 0.55) { _ in
            animationCompletion(presentedController)
        }
    }
    
//    func testConfigureBlockWhenPresentScreenWorking() throws {
//        Navigator.setRootScreen(view: self.testView, configureBlock: nil)
//        
//        self.presentScreenAndWaitCancelTransitionAnimation { presentedController in
//            XCTAssertEqual(Navigator.presentedController, presentedController)
//        }
//        
//        Navigator.setRootScreenWithNavBar(view: self.testView, title: "Foo") { view in
//            view?.presenter.setTestString("Bar")
//        }
//        
//        XCTAssertEqual(self.testView.presenter.data.testString, "Bar")
//    }
    
    
}
