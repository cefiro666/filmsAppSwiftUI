//
//  Presenting.swift
//  filmsAppSwiftUI
//
//  Created by Виталий Баник on 15/10/2020.
//  Copyright © 2020 Sequenia. All rights reserved.
//

import Foundation

// MARK: - PresentingPresenter
protocol PresentingPresenter: Presenter {

    var router: PresentingRouter? { get set }
    var data: PresentingData { get }

    func onClickDismiss()
}

// MARK: - PresentingPresenterImpl
final class PresentingPresenterImpl: PresentingPresenter {
    
// MARK: - Properties
    var router: PresentingRouter?
    weak var container: Container?
    
// MARK: - Published data
    @Published var data = PresentingData()

// MARK: - Methods
    func onClickDismiss() {
        self.router?.dismissScreen(completion: nil)
    }
    
}
