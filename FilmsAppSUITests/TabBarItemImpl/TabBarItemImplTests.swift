//
//  TabBarItemImplTests.swift
//  FilmsAppSUITests
//
//  Created by Виталий Баник on 16.10.2020.
//  Copyright © 2020 Виталий Баник. All rights reserved.
//

import XCTest
@testable import FilmsAppSUI

// MARK: - TabBarItemImplTests
class TabBarItemImplTests: XCTestCase {
    
// MARK: - Properties
    let sut = TabBarItemImpl.self

    func testTabIndexReturnsValidIndex() {
        for tabItem in self.sut.allCases {
            if tabItem.tabIndex != tabItem.rawValue { XCTFail() }
        }
    }

}
