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
    
// MARK: - Setup and tear down
    override func setUpWithError() throws {
        try super.setUpWithError()
        self.sut = TestModuleRouterImpl()
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
        self.sut = nil
    }
    
// MARK: - Tests
    func testCurrentRootControllerAfterSetRootScreenNotEqualByNil() throws {
        self.sut.setRootScreen(view: TestModuleView.self, configureBlock: nil)
        
        XCTAssertNotNil(self.sut.rootController)
    }
    
    func testCurrentRootControllerAfterSetRootScreenEqualByStatedScreen() throws {
        let controller = self.sut.setRootScreen(view: TestModuleView.self, configureBlock: nil)
        
        XCTAssertEqual(controller, self.sut.rootController)
    }
    
    func testConfigureBlockWhenSetRootScreenkWorking() throws {
        var testableView: TestModuleView?
        
        self.sut.setRootScreen(view: TestModuleView.self) { view in
            testableView = view
            view?.presenter.setTestString("Foo")
        }
        
        XCTAssertEqual(testableView?.presenter.data.testString, "Foo")
    }
    
    func testCurrentRootControllerAfterSetRootScreenWithNavBarNotEqualByNil() throws {
        self.sut.setRootScreenWithNavBar(view: TestModuleView.self, title: "Foo", configureBlock: nil)
        
        XCTAssertNotNil(self.sut.rootController)
    }
    
    func testCurrentRootControllerAfterSetRootScreenWithNavBarEqualByStatedScreen() throws {
        let controller = self.sut.setRootScreenWithNavBar(view: TestModuleView.self,
                                                          title: "Foo",
                                                          configureBlock: nil)
        
        XCTAssertEqual(controller, self.sut.rootController)
    }
    
    func testCurrentRootControllerTitleAfterSetRootScreenWithNavBarEqualByStatedTitle() throws {
        self.sut.setRootScreenWithNavBar(view: TestModuleView.self,
                                         title: "Foo",
                                         configureBlock: nil)
        
        XCTAssertEqual(self.sut.rootController?.title, "Foo")
    }
    
    func testConfigureBlockWhenSetRootScreenWithNavBarWorking() throws {
        var testableView: TestModuleView?
        
        self.sut.setRootScreenWithNavBar(view: TestModuleView.self, title: "Foo") { view in
            testableView = view
            view?.presenter.setTestString("Bar")
        }
        
        XCTAssertEqual(testableView?.presenter.data.testString, "Bar")
    }
    
    func testSelectedTabAfterSetTabEqualByStatedTab() throws {
        self.tabControllerWasTuned()
        
        self.sut.setTab(Tab.oneTab)
     
        XCTAssertEqual(self.sut.tabBarController?.selectedIndex, Tab.oneTab.tabIndex)
        
        self.sut.setTab(Tab.twoTab)
     
        XCTAssertEqual(self.sut.tabBarController?.selectedIndex, Tab.twoTab.tabIndex)
    }
    
    func testPresentedControllerAfterPresentScreenEqualPresentedScreen() throws {
        self.sut.setRootScreen(view: TestModuleView.self, configureBlock: nil)
        
        let presentedController = self.sut.presentScreen(view: TestModuleView.self, configureBlock: nil)
        
        self.waitCancelAnimationAndCheck() {
            XCTAssertEqual(self.sut.presentedController, presentedController)
        }
    }
    
    func testConfigureBlockWhenPresentScreenWorking() throws {
        self.sut.setRootScreen(view: TestModuleView.self, configureBlock: nil)
        
        var testableView: TestModuleView?
        
        self.sut.presentScreen(view: TestModuleView.self) { view in
            testableView = view
            view?.presenter.setTestString("Foo")
        }
        
        XCTAssertEqual(testableView?.presenter.data.testString, "Foo")
    }
    
    func testReturnedControllerWhenGetScreenNotEqualByNil() throws {
        let controller = self.sut.getScreen(view: TestModuleView.self, configureBlock: nil)
        
        XCTAssertNotNil(controller)
    }
    
    func testReturnedControllerWhenGetScreenIncludesTransmittedView() throws {
        var testableView: TestModuleView?
        
        self.sut.getScreen(view: TestModuleView.self) { view in
            testableView = view
            view?.presenter.setTestString("Foo")
        }
        
        XCTAssertEqual(testableView?.presenter.data.testString, "Foo")
    }
    
    func testReturnedControllerWhenGetScreenWithNavBarIncludesTransmittedView() throws {
        var testableView: TestModuleView?
        
        self.sut.getScreenWithNavBar(view: TestModuleView.self, title: "Foo") { view in
            testableView = view
            view?.presenter.setTestString("Bar")
        }
        
        XCTAssertEqual(testableView?.presenter.data.testString, "Bar")
    }
    
    func testTitleReturnedControllerWhenGetScreenWithNavBarEqualByStatedTitle() throws {
        let controller = self.sut.getScreenWithNavBar(view: TestModuleView.self, title: "Foo", configureBlock: nil)
        
        XCTAssertEqual(controller?.title, "Foo")
    }
    
    func testReturnedControllerWhenGetScreenWithNavBarNotEqualByNil() throws {
        let controller = self.sut.getScreenWithNavBar(view: TestModuleView.self, title: "Foo", configureBlock: nil)
        
        XCTAssertNotNil(controller)
    }
    
    func testNavigationControllerAfterSetRootScreenWithNavBarNotEqualByNil() throws {
        let controller = self.sut.setRootScreen(view: TestModuleView.self, configureBlock: nil)
        
        XCTAssertNotNil(controller)
    }
    
    func testNavigationControllerAfterSetRootScreenWithNavBarEqualByStatedController() throws {
        let controller = self.sut.setRootScreenWithNavBar(view: TestModuleView.self, title: "Foo", configureBlock: nil)
        
        XCTAssertEqual(controller, self.sut.navigationController)
    }
    
    func testCurrentControllerAfterDismissScreenEqualByStatedControllerBeforePresent() throws {
        let controller = self.sut.setRootScreen(view: TestModuleView.self, configureBlock: nil)

        self.sut.presentScreen(view: TestModuleView.self, configureBlock: nil)

        self.waitCancelAnimationAndCheck() {
            XCTAssertNotEqual(self.sut.presentedController, controller)
            
            self.sut.dismissScreen(completion: nil)
            
            self.waitCancelAnimationAndCheck() {
                XCTAssertEqual(self.sut.presentedController, controller)
            }
        }
    }
    
    func testNavigationControllerAfterPresentScreenWithNavBarEqualByPresentedController() throws {
        self.sut.setRootScreen(view: TestModuleView.self, configureBlock: nil)
 
        let presentedController = self.sut.presentScreenWithNavBar(view: TestModuleView.self,
                                                                   title: "Foo",
                                                                   configureBlock: nil)

        XCTAssertEqual(self.sut.navigationController, presentedController)
    }
    
    func testTopControllerAfterPushScreenEqualByPushedController() throws {
        self.sut.setRootScreenWithNavBar(view: TestModuleView.self, title: "Foo", configureBlock: nil)
 
        let pushedController = self.sut.pushScreen(view: TestModuleView.self,
                                                   title: "Bar",
                                                   configureBlock: nil)

        self.waitCancelAnimationAndCheck() {
            XCTAssertEqual(self.sut.navigationController?.topViewController, pushedController)
        }
    }
    
    func testTopControllerTitleAfterPushScreenEqualByStatedTitle() throws {
        self.sut.setRootScreenWithNavBar(view: TestModuleView.self, title: "Foo", configureBlock: nil)
 
        self.sut.pushScreen(view: TestModuleView.self, title: "Bar", configureBlock: nil)

        self.waitCancelAnimationAndCheck() {
            XCTAssertEqual(self.sut.navigationController?.topViewController?.title, "Bar")
        }
    }
    
    func testConfigureBlockWhenPushScreenWorking() throws {
        self.sut.setRootScreenWithNavBar(view: TestModuleView.self, title: "Foo", configureBlock: nil)
 
        var testableView: TestModuleView?
        
        self.sut.pushScreen(view: TestModuleView.self, title: "Bar") { view in
            testableView = view
            view?.presenter.setTestString("Baz")
        }

        self.waitCancelAnimationAndCheck() {
            XCTAssertEqual(testableView?.presenter.data.testString, "Baz")
        }
    }
    
    func testTabBarAfterPushScreenShowed() throws {
        self.sut.setRootScreenWithNavBar(view: TestModuleView.self, title: "Foo", configureBlock: nil)
 
        self.sut.pushScreen(view: TestModuleView.self, title: "Bar", configureBlock: nil)

        self.waitCancelAnimationAndCheck() {
            XCTAssertFalse(self.sut.navigationController?.topViewController?.hidesBottomBarWhenPushed ?? true)
        }
    }
    
    func testTopControllerAfterPushScreenWithHidenTabBarEqualByPushedController() throws {
        self.sut.setRootScreenWithNavBar(view: TestModuleView.self, title: "Foo", configureBlock: nil)
 
        let pushedController = self.sut.pushScreenWithHidenTabBar(view: TestModuleView.self,
                                                                  title: "Bar",
                                                                  configureBlock: nil)

        self.waitCancelAnimationAndCheck() {
            XCTAssertEqual(self.sut.navigationController?.topViewController, pushedController)
        }
    }
    
    func testTopControllerTitleAfterPushScreenWithHidenTabBarEqualByStatedTitle() throws {
        self.sut.setRootScreenWithNavBar(view: TestModuleView.self, title: "Foo", configureBlock: nil)
 
        self.sut.pushScreenWithHidenTabBar(view: TestModuleView.self, title: "Bar", configureBlock: nil)

        self.waitCancelAnimationAndCheck() {
            XCTAssertEqual(self.sut.navigationController?.topViewController?.title, "Bar")
        }
    }
    
    func testConfigureBlockWhenPushScreeWithHidenTabBarnWorking() throws {
        self.sut.setRootScreenWithNavBar(view: TestModuleView.self, title: "Foo", configureBlock: nil)
 
        var testableView: TestModuleView?
        
        self.sut.pushScreenWithHidenTabBar(view: TestModuleView.self, title: "Bar") { view in
            testableView = view
            view?.presenter.setTestString("Baz")
        }

        self.waitCancelAnimationAndCheck() {
            XCTAssertEqual(testableView?.presenter.data.testString, "Baz")
        }
    }
    
    func testTabBarAfterPushScreenWithHidenTabBarHiden() throws {
        self.sut.setRootScreenWithNavBar(view: TestModuleView.self, title: "Foo", configureBlock: nil)
 
        self.sut.pushScreenWithHidenTabBar(view: TestModuleView.self, title: "Bar", configureBlock: nil)

        self.waitCancelAnimationAndCheck() {
            XCTAssertTrue(self.sut.navigationController?.topViewController?.hidesBottomBarWhenPushed ?? true)
        }
    }
    
    func testCurrentControllerAfterPopScreenEqualByStatedControllerBeforePushScreen() {
        self.sut.setRootScreenWithNavBar(view: TestModuleView.self, title: "Foo", configureBlock: nil)
        
        let pushedController = self.sut.pushScreen(view: TestModuleView.self, title: "Bar", configureBlock: nil)

        self.waitCancelAnimationAndCheck() {
            XCTAssertEqual(self.sut.navigationController?.topViewController, pushedController)
            
            self.sut.popScreen()
            
            self.waitCancelAnimationAndCheck() {
                XCTAssertNotEqual(self.sut.navigationController?.topViewController, pushedController)
            }
        }
    }
    
    func testPresentedControllerAfterShowPopupEqualByShowedController() {
        self.sut.setRootScreen(view: TestModuleView.self, configureBlock: nil)
        
        let popupController = self.sut.showPopupScreen(view: TestModuleView.self, height: 300.0, configureBlock: nil)

        self.waitCancelAnimationAndCheck() {
            XCTAssertEqual(self.sut.presentedController, popupController)
        }
    }
    
    func testPresentedControllerHeightAfterShowPopupEqualByStatedHeight() {
        self.sut.setRootScreen(view: TestModuleView.self, configureBlock: nil)
        
        self.sut.showPopupScreen(view: TestModuleView.self, height: 300.0, configureBlock: nil)

        self.waitCancelAnimationAndCheck() {
            XCTAssertEqual(self.sut.presentedController?.view.frame.size.height, 300.0)
        }
    }
    
    func testConfigureBlockWhenShowPopupWorking() {
        self.sut.setRootScreen(view: TestModuleView.self, configureBlock: nil)
        
        var testableView: TestModuleView?
        self.sut.showPopupScreen(view: TestModuleView.self, height: 300.0) { view in
            testableView = view
            view?.presenter.setTestString("Foo")
        }
        
        self.waitCancelAnimationAndCheck() {
            XCTAssertEqual(testableView?.presenter.data.testString, "Foo")
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
            case .oneTab: return TestModuleConfigurator.createScreen(configureBlock: nil)
            case .twoTab: return TestModuleConfigurator.createScreen(configureBlock: nil)
            }
        }
    }
    
// MARK: - MockSceneDelegate
    private func tabControllerWasTuned() {
        self.sut.window?.rootViewController = TabBarConfigurator.getTabBarFromTabBarItemType(Tab.self)
    }
    
    private func waitCancelAnimationAndCheck(checkBlock: @escaping () -> ()) {
        let cancelAnimationExpectation = self.expectation(description: "Cancel animation expectation")
        DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(2)) {
            cancelAnimationExpectation.fulfill()
        }
        
        waitForExpectations(timeout: 2.5) { _ in
            checkBlock()
        }
    }
    
}
