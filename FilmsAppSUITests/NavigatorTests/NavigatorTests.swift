//
//  NavigatorTests.swift
//  FilmsAppSUITests
//
//  Created by Виталий Баник on 06.10.2020.
//  Copyright © 2020 Виталий Баник. All rights reserved.
//

import XCTest
@testable import FilmsAppSUI

// MARK: - NavigatorTests
class NavigatorTests: XCTestCase {

// MARK: - Properties
    var sut: Navigator.Type!
    
    var testView: TestModuleView<TestModulePresenterImpl>!
    
    var mockSceneDelegate: UIWindowSceneDelegate?
    var currentRootController: UIViewController? { self.mockSceneDelegate?.window??.rootViewController }
    
// MARK: - Setup and tear down
    override func setUpWithError() throws {
        self.sut = Utils.navigator
        
        self.testView = TestModuleView(presenter: TestModulePresenterImpl())
        
        self.mockSceneDelegate = MockSceneDelegate()
        self.sut.sceneDelegate = self.mockSceneDelegate
    }

    override func tearDownWithError() throws {
        self.sut = nil
        self.testView = nil
        self.mockSceneDelegate = nil
    }
    
    func testSceneDelegateAfterSetSceneDelegateNotEqualByNil() throws {
        XCTAssertNotNil(self.sut.sceneDelegate)
    }
    
    func testSceneDelegateAfterSetSceneDelegateEqualByStatedSceneDelegate() throws {
        XCTAssertEqual(self.sut.sceneDelegate.debugDescription, self.mockSceneDelegate.debugDescription)
    }
    
    func testCurrentRootControllerAfterSetRootScreenNotEqualByNil() throws {
        self.sut.setRootScreen(view: self.testView, configureBlock: nil)
        
        XCTAssertNotNil(self.currentRootController)
    }
    
    func testCurrentRootControllerAfterSetRootScreenEqualByStatedScreen() throws {
        let controller = self.sut.setRootScreen(view: self.testView, configureBlock: nil)
        
        XCTAssertEqual(controller, self.currentRootController)
    }
    
    func testConfigureBlockWhenSetRootScreenkWorking() throws {
        self.sut.setRootScreen(view: self.testView) { view in
            view?.presenter.setTestString("Foo")
        }
        
        XCTAssertEqual(self.testView.presenter.data.testString, "Foo")
    }
    
    func testCurrentRootControllerAfterSetRootScreenWithNavBarNotEqualByNil() throws {
        self.sut.setRootScreenWithNavBar(view: self.testView, title: "Foo", configureBlock: nil)
        
        XCTAssertNotNil(self.currentRootController)
    }
    
    func testCurrentRootControllerAfterSetRootScreenWithNavBarEqualByStatedScreen() throws {
        let controller = self.sut.setRootScreenWithNavBar(view: self.testView,
                                                          title: "Foo",
                                                          configureBlock: nil)
        
        XCTAssertEqual(controller, self.currentRootController)
    }
    
    func testCurrentRootControllerTitleAfterSetRootScreenWithNavBarEqualByStatedTitle() throws {
        self.sut.setRootScreenWithNavBar(view: self.testView,
                                         title: "Foo",
                                         configureBlock: nil)
        
        XCTAssertEqual("Foo", self.currentRootController?.title)
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
        
        let someView = TestModuleView(presenter: TestModulePresenterImpl())
        let presentedController = self.sut.presentScreen(view: someView, configureBlock: nil)
        
        let exp = self.expectation(description: "Test Navigator.shared.presentScreen method")
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            exp.fulfill()
        }

        waitForExpectations(timeout: 0.55) { _ in
            XCTAssertEqual(self.sut.presentedController, presentedController)
        }
    }
    
    func testConfigureBlockWhenPresentScreenWorking() throws {
        self.sut.setRootScreen(view: self.testView, configureBlock: nil)
        
        let someView = TestModuleView(presenter: TestModulePresenterImpl())
        self.sut.presentScreen(view: someView) { view in
            view?.presenter.setTestString("Foo")
        }
        
        XCTAssertEqual(someView.presenter.data.testString, "Foo")
    }
    
    func testReturnedControllerWhenGetScreenNotEqualByNil() throws {
        let someView = TestModuleView(presenter: TestModulePresenterImpl())
        let controller = self.sut.getScreen(view: someView, configureBlock: nil)
        
        XCTAssertNotNil(controller)
    }
    
    func testReturnedControllerWhenGetScreenIncludesTransmittedView() throws {
        let someView = TestModuleView(presenter: TestModulePresenterImpl())

        self.sut.getScreen(view: someView) { view in
            view?.presenter.setTestString("Foo")
        }
        
        XCTAssertEqual(someView.presenter.data.testString, "Foo")
    }
    
    func testReturnedControllerWhenGetScreenWithNavBarIncludesTransmittedView() throws {
        let someView = TestModuleView(presenter: TestModulePresenterImpl())

        self.sut.getScreenWithNavBar(view: someView, title: "Foo") { view in
            view?.presenter.setTestString("Bar")
        }
        
        XCTAssertEqual(someView.presenter.data.testString, "Bar")
    }
    
    func testTitleReturnedControllerWhenGetScreenWithNavBarEqualByStatedTitle() throws {
        let someView = TestModuleView(presenter: TestModulePresenterImpl())

        let controller = self.sut.getScreenWithNavBar(view: someView, title: "Foo", configureBlock: nil)
        
        XCTAssertEqual(controller?.title, "Foo")
    }
    
    func testReturnedControllerWhenGetScreenWithNavBarNotEqualByNil() throws {
        let someView = TestModuleView(presenter: TestModulePresenterImpl())
        let controller = self.sut.getScreenWithNavBar(view: someView, title: "Foo", configureBlock: nil)
        
        XCTAssertNotNil(controller)
    }
    
}

// MARK: - extensions
extension NavigatorTests {
    
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
            case .oneTab: return Utils.navigator.getScreen(view: TestModuleView(presenter: TestModulePresenterImpl()),
                                                               configureBlock: nil)
                
            case .twoTab: return Utils.navigator.getScreen(view: TestModuleView(presenter: TestModulePresenterImpl()),
                                                           configureBlock: nil)
            }
        }
    }
    
// MARK: - MockSceneDelegate
    class MockSceneDelegate: NSObject, UIWindowSceneDelegate {
        
        var window: UIWindow?
         
        override init() {
            self.window = UIWindow()
            self.window?.makeKeyAndVisible()
        }
    }
    
    private func tabControllerWasTuned() {
        let tabBarController = UITabBarController()
        tabBarController.setViewControllers([UIViewController(), UIViewController()], animated: false)
        self.mockSceneDelegate?.window??.rootViewController = tabBarController
    }
    
}
