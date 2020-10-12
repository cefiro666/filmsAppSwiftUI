//
//  Test.swift
//  filmsAppSwiftUI
//
//  Created by Виталий Баник on 05/10/2020.
//  Copyright © 2020 Sequenia. All rights reserved.
//

import Foundation

// MARK: - TestPresenter
protocol TestPresenter: Presenter {

    var router: TestRouter? { get set }
    var data: TestData { get }

    func onClickText()
}

// MARK: - TestPresenterImpl
final class TestPresenterImpl: TestPresenter {
    
// MARK: - Properties
    var router: TestRouter?
    weak var container: Container?
    
// MARK: - Published data
    @Published var data = TestData()

// MARK: - Methods
    func onClickText() {
        self.router?.presentFilmsListView()
    }
    
}
