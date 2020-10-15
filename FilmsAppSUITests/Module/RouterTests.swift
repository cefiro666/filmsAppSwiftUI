//
//  RouterTests.swift
//  FilmsAppSUITests
//
//  Created by Виталий Баник on 06.10.2020.
//  Copyright © 2020 Виталий Баник. All rights reserved.
//

import XCTest
@testable import FilmsAppSUI

// MARK: - NavigatorTests
class RouterTests: XCTestCase {

// MARK: - Properties
    var sut: Router!
    
    var testView: TestModuleView!
    var mockSceneDelegate: UIWindowSceneDelegate?
    
// MARK: - Setup and tear down
    override func setUpWithError() throws {
        self.sut = TestModuleRouterImpl()
        self.testView = TestModuleView()
    }

    override func tearDownWithError() throws {
        self.sut = nil
        self.testView = nil
    }
    
// MARK: - Tests
    func testCurrentRootControllerAfterSetRootScreenNotEqualByNil() throws {
        self.sut.setRootScreen(view: self.testView, configureBlock: nil)
        
        XCTAssertNotNil(self.sut.rootController)
    }
    
    func testCurrentRootControllerAfterSetRootScreenEqualByStatedScreen() throws {
        let controller = self.sut.setRootScreen(view: self.testView, configureBlock: nil)
        
        XCTAssertEqual(controller, self.sut.rootController)
    }
    
    func testConfigureBlockWhenSetRootScreenkWorking() throws {
        self.sut.setRootScreen(view: self.testView) { view in
            view?.presenter.setTestString("Foo")
        }
        
        XCTAssertEqual(self.testView.presenter.data.testString, "Foo")
    }
    
    func testCurrentRootControllerAfterSetRootScreenWithNavBarNotEqualByNil() throws {
        self.sut.setRootScreenWithNavBar(view: self.testView, title: "Foo", configureBlock: nil)
        
        XCTAssertNotNil(self.sut.rootController)
    }
    
    func testCurrentRootControllerAfterSetRootScreenWithNavBarEqualByStatedScreen() throws {
        let controller = self.sut.setRootScreenWithNavBar(view: self.testView,
                                                          title: "Foo",
                                                          configureBlock: nil)
        
        XCTAssertEqual(controller, self.sut.rootController)
    }
    
    func testCurrentRootControllerTitleAfterSetRootScreenWithNavBarEqualByStatedTitle() throws {
        self.sut.setRootScreenWithNavBar(view: self.testView,
                                         title: "Foo",
                                         configureBlock: nil)
        
        XCTAssertEqual(self.sut.rootController?.title, "Foo")
    }
    
    func testConfigureBlockWhenSetRootScreenWithNavBarWorking() throws {
        self.sut.setRootScreenWithNavBar(view: self.testView, title: "Foo") { view in
            view?.presenter.setTestString("Bar")
        }
        
        XCTAssertEqual(self.testView.presenter.data.testString, "Bar")
    }
    
    func testSelectedTabAfterSetTabEqualByStatedTab() throws {
        self.tabControllerWasTuned()
        
        self.sut.setTab(Tab.oneTab)
     
        XCTAssertEqual(self.sut.tabBarController?.selectedIndex, Tab.oneTab.tabIndex)
        
        self.sut.setTab(Tab.twoTab)
     
        XCTAssertEqual(self.sut.tabBarController?.selectedIndex, Tab.twoTab.tabIndex)
    }
    
    func testPresentedControllerAfterPresentScreenEqualPresentedScreen() throws {
        self.sut.setRootScreen(view: self.testView, configureBlock: nil)
        
        let someView = TestModuleView()
        let presentedController = self.sut.presentScreen(view: someView, configureBlock: nil)
        
        self.waitCancelAnimationAndCheck() {
            XCTAssertEqual(self.sut.presentedController, presentedController)
        }
    }
    
    func testConfigureBlockWhenPresentScreenWorking() throws {
        self.sut.setRootScreen(view: self.testView, configureBlock: nil)
        
        let someView = TestModuleView()
        self.sut.presentScreen(view: someView) { view in
            view?.presenter.setTestString("Foo")
        }
        
        XCTAssertEqual(someView.presenter.data.testString, "Foo")
    }
    
    func testReturnedControllerWhenGetScreenNotEqualByNil() throws {
        let controller = self.sut.getScreen(view: self.testView, configureBlock: nil)
        
        XCTAssertNotNil(controller)
    }
    
    func testReturnedControllerWhenGetScreenIncludesTransmittedView() throws {
        self.sut.getScreen(view: self.testView) { view in
            view?.presenter.setTestString("Foo")
        }
        
        XCTAssertEqual(self.testView.presenter.data.testString, "Foo")
    }
    
    func testReturnedControllerWhenGetScreenWithNavBarIncludesTransmittedView() throws {
        self.sut.getScreenWithNavBar(view: self.testView, title: "Foo") { view in
            view?.presenter.setTestString("Bar")
        }
        
        XCTAssertEqual(self.testView.presenter.data.testString, "Bar")
    }
    
    func testTitleReturnedControllerWhenGetScreenWithNavBarEqualByStatedTitle() throws {
        let controller = self.sut.getScreenWithNavBar(view: self.testView, title: "Foo", configureBlock: nil)
        
        XCTAssertEqual(controller?.title, "Foo")
    }
    
    func testReturnedControllerWhenGetScreenWithNavBarNotEqualByNil() throws {
        let controller = self.sut.getScreenWithNavBar(view: self.testView, title: "Foo", configureBlock: nil)
        
        XCTAssertNotNil(controller)
    }
    
    func testNavigationControllerAfterSetRootScreenWithNavBarNotEqualByNil() throws {
        let controller = self.sut.setRootScreen(view: self.testView, configureBlock: nil)
        
        XCTAssertNotNil(controller)
    }
    
    func testNavigationControllerAfterSetRootScreenWithNavBarEqualByStatedController() throws {
        let controller = self.sut.setRootScreenWithNavBar(view: self.testView, title: "Foo", configureBlock: nil)
        
        XCTAssertEqual(controller, self.sut.navigationController)
    }
    
    func testCurrentControllerAfterDismissScreenEqualByStatedControllerBeforePresent() throws {
        let controller = self.sut.setRootScreen(view: self.testView, configureBlock: nil)

        self.sut.presentScreen(view: self.testView, configureBlock: nil)

        self.waitCancelAnimationAndCheck() {
            XCTAssertNotEqual(self.sut.presentedController, controller)
            
            self.sut.dismissScreen(completion: nil)
            
            self.waitCancelAnimationAndCheck() {
                XCTAssertEqual(self.sut.presentedController, controller)
            }
        }
    }
    
    func testNavigationControllerAfterPresentScreenWithNavBarEqualByPresentedController() throws {
        self.sut.setRootScreen(view: self.testView, configureBlock: nil)
 
        let presentedController = self.sut.presentScreenWithNavBar(view: self.testView,
                                                                   title: "Foo",
                                                                   configureBlock: nil)

        XCTAssertEqual(self.sut.navigationController, presentedController)
    }
    
    func testTopControllerAfterPushScreenEqualByPushedController() throws {
        self.sut.setRootScreenWithNavBar(view: self.testView, title: "Foo", configureBlock: nil)
 
        let pushedController = self.sut.pushScreen(view: self.testView,
                                                   title: "Bar",
                                                   configureBlock: nil)

        self.waitCancelAnimationAndCheck() {
            XCTAssertEqual(self.sut.navigationController?.topViewController, pushedController)
        }
    }
    
    func testTopControllerTitleAfterPushScreenEqualByStatedTitle() throws {
        self.sut.setRootScreenWithNavBar(view: self.testView, title: "Foo", configureBlock: nil)
 
        self.sut.pushScreen(view: self.testView, title: "Bar", configureBlock: nil)

        self.waitCancelAnimationAndCheck() {
            XCTAssertEqual(self.sut.navigationController?.topViewController?.title, "Bar")
        }
    }
    
    func testConfigureBlockWhenPushScreenWorking() throws {
        self.sut.setRootScreenWithNavBar(view: self.testView, title: "Foo", configureBlock: nil)
 
        let someView = TestModuleView()
        self.sut.pushScreen(view: someView, title: "Bar") { view in
            view?.presenter.setTestString("Baz")
        }

        self.waitCancelAnimationAndCheck() {
            XCTAssertEqual(someView.presenter.data.testString, "Baz")
        }
    }
    
    func testTabBarAfterPushScreenShowed() throws {
        self.sut.setRootScreenWithNavBar(view: self.testView, title: "Foo", configureBlock: nil)
 
        self.sut.pushScreen(view: self.testView, title: "Bar", configureBlock: nil)

        self.waitCancelAnimationAndCheck() {
            XCTAssertFalse(self.sut.navigationController?.topViewController?.hidesBottomBarWhenPushed ?? true)
        }
    }
    
    func testTopControllerAfterPushScreenWithHidenTabBarEqualByPushedController() throws {
        self.sut.setRootScreenWithNavBar(view: self.testView, title: "Foo", configureBlock: nil)
 
        let pushedController = self.sut.pushScreenWithHidenTabBar(view: self.testView,
                                                                  title: "Bar",
                                                                  configureBlock: nil)

        self.waitCancelAnimationAndCheck() {
            XCTAssertEqual(self.sut.navigationController?.topViewController, pushedController)
        }
    }
    
    func testTopControllerTitleAfterPushScreenWithHidenTabBarEqualByStatedTitle() throws {
        self.sut.setRootScreenWithNavBar(view: self.testView, title: "Foo", configureBlock: nil)
 
        self.sut.pushScreenWithHidenTabBar(view: self.testView, title: "Bar", configureBlock: nil)

        self.waitCancelAnimationAndCheck() {
            XCTAssertEqual(self.sut.navigationController?.topViewController?.title, "Bar")
        }
    }
    
    func testConfigureBlockWhenPushScreeWithHidenTabBarnWorking() throws {
        self.sut.setRootScreenWithNavBar(view: self.testView, title: "Foo", configureBlock: nil)
 
        let someView = TestModuleView()
        self.sut.pushScreenWithHidenTabBar(view: someView, title: "Bar") { view in
            view?.presenter.setTestString("Baz")
        }

        self.waitCancelAnimationAndCheck() {
            XCTAssertEqual(someView.presenter.data.testString, "Baz")
        }
    }
    
    func testTabBarAfterPushScreenWithHidenTabBarHiden() throws {
        self.sut.setRootScreenWithNavBar(view: self.testView, title: "Foo", configureBlock: nil)
 
        self.sut.pushScreenWithHidenTabBar(view: self.testView, title: "Bar", configureBlock: nil)

        self.waitCancelAnimationAndCheck() {
            XCTAssertTrue(self.sut.navigationController?.topViewController?.hidesBottomBarWhenPushed ?? true)
        }
    }
    
    func testCurrentControllerAfterPopScreenEqualByStatedControllerBeforePushScreen() {
        self.sut.setRootScreenWithNavBar(view: self.testView, title: "Foo", configureBlock: nil)
        
        let pushedController = self.sut.pushScreen(view: self.testView, title: "Bar", configureBlock: nil)

        self.waitCancelAnimationAndCheck() {
            XCTAssertEqual(self.sut.navigationController?.topViewController, pushedController)
            
            self.sut.popScreen()
            
            self.waitCancelAnimationAndCheck() {
                XCTAssertNotEqual(self.sut.navigationController?.topViewController, pushedController)
            }
        }
    }
    
}

// MARK: - extensions
extension RouterTests {
    
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
            case .oneTab: return TestModuleConfigurator.createScreen(withView: TestModuleView(), configureBlock: nil)
            case .twoTab: return TestModuleConfigurator.createScreen(withView: TestModuleView(), configureBlock: nil)
            }
        }
    }
    
// MARK: - MockSceneDelegate
    private func tabControllerWasTuned() {
        self.sut.window?.rootViewController = TabBarConfigurator.getTabBarFromTabBarItemType(Tab.self)
    }
    
    private func waitCancelAnimationAndCheck(checkBlock: @escaping () -> ()) {
        let cancelAnimationExpectation = self.expectation(description: "Cancel animation expectation")
        DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(1)) {
            cancelAnimationExpectation.fulfill()
        }
        
        waitForExpectations(timeout: 1) { _ in
            checkBlock()
        }
    }
    
}
