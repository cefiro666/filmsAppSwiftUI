//
//  Pushing.swift
//  filmsAppSwiftUI
//
//  Created by Виталий Баник on 15/10/2020.
//  Copyright © 2020 Sequenia. All rights reserved.
//

import Foundation

// MARK: - PushingPresenter
protocol PushingPresenter: Presenter {

    var router: PushingRouter? { get set }
    var data: PushingData { get }

    func onClickPop()
}

// MARK: - PushingPresenterImpl
final class PushingPresenterImpl: PushingPresenter {
    
// MARK: - Vuper
    var router: PushingRouter?
    weak var container: Container?
    
// MARK: - Published data
    @Published var data = PushingData()

// MARK: - Methods
    func onClickPop() {
        self.router?.popScreen()
    }
    
}
