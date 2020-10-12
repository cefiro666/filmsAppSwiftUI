//
//  TestPresent.swift
//  filmsAppSwiftUI
//
//  Created by Виталий Баник on 06/10/2020.
//  Copyright © 2020 Sequenia. All rights reserved.
//

import Foundation

// MARK: - TestPresentPresenter
protocol TestPresentPresenter: Presenter {
    associatedtype ViewType: Presentable
    
    var view: ViewType? { get set }
    var router: TestPresentRouter? { get set }
    var data: TestPresentData { get }

    func onTapDismissButton()
}

// MARK: - TestPresentPresenterImpl
final class TestPresentPresenterImpl: TestPresentPresenter {
    
// MARK: - Properties
    var view: TestPresentView?
    var router: TestPresentRouter?

    var container: Container?
    
// MARK: - Published data
    @Published var data = TestPresentData()

// MARK: - Methods
    func onTapDismissButton() {
        self.router?.dismissScreen(completion: nil)
    }
    
}
