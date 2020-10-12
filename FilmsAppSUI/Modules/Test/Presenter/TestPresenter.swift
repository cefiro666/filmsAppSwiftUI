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
    associatedtype ViewType: Presentable
    
    var view: ViewType? { get set }
    var router: TestRouter? { get set }
    var data: TestData { get }

    func onClickText()
}

// MARK: - TestPresenterImpl
final class TestPresenterImpl: TestPresenter {
    
// MARK: - Properties
    var view: TestView?
    var router: TestRouter?

    var container: Container?
    
// MARK: - Published data
    @Published var data = TestData()

// MARK: - Methods
    func onClickText() {
        self.router?.presentFilmsListView()
    }
    
}
