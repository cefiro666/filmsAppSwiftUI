//
//  FilmsAppSUITests.swift
//  FilmsAppSUITests
//
//  Created by Виталий Баник on 22.09.2020.
//  Copyright © 2020 Виталий Баник. All rights reserved.
//

import XCTest
@testable import FilmsAppSUI

class FilmsAppSUITests: XCTestCase {

    var sut: FilmsListPresenterImpl!
    
    override func setUpWithError() throws {
        super.setUp()
        
        self.sut = FilmsListPresenterImpl()
    }

    override func tearDownWithError() throws {
        sut = nil
        
        super.tearDown()
    }

// название метода теста - условие которое проверяем
    func testLoadFilmsOnlyOnce() {
        // given - что дано
        // when - что произошло
        // then - что должно получиться
        
        
        
        self.sut.data.films.append(Film.placeholder)
        self.sut.viewOnAppear()
        
        XCTAssert(sut.data.films.count == 1, "Films load only once")
    }
    
    func testFilmModelPlaceholerEqualFilmPlaceholer() {
        let filmPlaceholder = Film.placeholder
        let filmModelPlaceholder = FilmModel.placeholder
        
        let placeholdersEqual = filmPlaceholder.id == Int(filmModelPlaceholder.id)
        
        XCTAssert(placeholdersEqual,
                  "Placeholders for Film and FilmModel should be equals")
        
    }
    
    func testSetFilmWhenInitFilmDetailsPresenter() {
        // given - Презентер
        let sut = FilmDetailsPresenterImpl()
        
        // when - Установили Film
        let testId = "1234"
        var film = Film.placeholder
        film.id = Int(testId) ?? .zero
        sut.setFilm(film)
        
        // then - FilmModel в data соответствует установленному Film
        XCTAssert(sut.data.filmModel.id == testId,
                  "Placeholders for Film and FilmModel should be equals")
        
    }
    
    func testSetNilAsFilmWhenInitFilmDetailsPresenter() {
        // given - Презентер
        let sut = FilmDetailsPresenterImpl()
        
        // when - Установили Film
        sut.setFilm(nil)
        
        // then - FilmModel в data соответствует установленному Film
        XCTAssert(sut.data.filmModel.id == String(Film.placeholder.id),
                  "Placeholders for Film and FilmModel should be equals")
        
    }

}
