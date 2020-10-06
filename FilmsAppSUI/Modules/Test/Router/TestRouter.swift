//
//  Test.swift
//  filmsAppSwiftUI
//
//  Created by Виталий Баник on 05/10/2020.
//  Copyright © 2020 Sequenia. All rights reserved.
//

import Foundation

// MARK: - TestRouter
protocol TestRouter: Router {
    
    func presentFilmsListView()
}

// MARK: - TestRouterImpl
struct TestRouterImpl: TestRouter {
    
    func presentFilmsListView() {
        Navigator.shared.presentScreenWithNavBar(view: TestPresentView(presenter: TestPresentPresenterImpl()),
                                                 title: "TestPresent",
                                                 configureBlock: nil)
    }
}

