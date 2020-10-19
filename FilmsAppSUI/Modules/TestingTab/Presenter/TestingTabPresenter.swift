//
//  TestingTab.swift
//  filmsAppSwiftUI
//
//  Created by Виталий Баник on 15/10/2020.
//  Copyright © 2020 Sequenia. All rights reserved.
//

import Foundation

// MARK: - TestingTabPresenter
protocol TestingTabPresenter: Presenter {

    var router: TestingTabRouter? { get set }
    var data: TestingTabData { get }
    
    func onClickPresentWithNavBar()
    func onClickPresent()
    func onClickPushWithHidenTabBar()
    func onClickPush()
}

// MARK: - TestingTabPresenterImpl
final class TestingTabPresenterImpl: TestingTabPresenter {
    
// MARK: - Vuper
    var router: TestingTabRouter?
    weak var container: Container?
    
// MARK: - Published data
    @Published var data = TestingTabData()

// MARK: - Methods
    func onClickPresentWithNavBar() {
        self.router?.presentTestViewWithNavBar()
    }
    func onClickPresent() {
        self.router?.presentTestView()
    }
    func onClickPushWithHidenTabBar() {
        self.router?.pushTestViewWithHidenTabBar()
    }
    func onClickPush() {
        self.router?.pushTestView()
    }
    
}
