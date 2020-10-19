//
//  GetFilmsUseCaseTests.swift
//  FilmsAppSUITests
//
//  Created by Виталий Баник on 16.10.2020.
//  Copyright © 2020 Виталий Баник. All rights reserved.
//

import XCTest
import Moya
@testable import FilmsAppSUI

class GetFilmsUseCaseTests: XCTestCase {

    var sut: GetFilmsUseCase?
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        let useCase = GetFilmsUseCaseImpl()
        useCase.provider = MoyaProvider<FilmsProvider>(stubClosure: MoyaProvider.delayedStub(1.0))
        self.sut = useCase
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
        self.sut = nil
    }
    
    func testGetFilmsUseCaseImplResponseIsSuccess() {
        let responseExpectation = self.expectation(description: "Response expectetion")
        var responseIsSuccess = false
        
        self.sut?.execute { (success, films, error) in
            responseIsSuccess = success
            responseExpectation.fulfill()
        }

        waitForExpectations(timeout: 1.5)
        XCTAssertTrue(responseIsSuccess)
    }
    
    func testGetFilmsUseCaseImplResponseContainsFilms() {
        let responseExpectation = self.expectation(description: "Response expectetion")
        var numberOfFilms = 0
        
        self.sut?.execute { (success, films, error) in
            numberOfFilms = films.count
            responseExpectation.fulfill()
        }

        waitForExpectations(timeout: 1.5)
        XCTAssertEqual(numberOfFilms, 1)
    }

}
