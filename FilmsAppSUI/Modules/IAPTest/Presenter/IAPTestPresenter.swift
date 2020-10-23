//
//  IAPTest.swift
//  filmsAppSwiftUI
//
//  Created by Виталий Баник on 23/10/2020.
//  Copyright © 2020 Sequenia. All rights reserved.
//

import Foundation

// MARK: - IAPTestPresenter
protocol IAPTestPresenter: Presenter {

    var router: IAPTestRouter? { get set }
    var data: IAPTestData { get }

    func viewOnAppear()
    func onClickProductWithId(_ id: String)
}

// MARK: - IAPTestPresenterImpl
final class IAPTestPresenterImpl: IAPTestPresenter {
    
// MARK: - Vuper
    var router: IAPTestRouter?
    weak var container: Container?
    
// MARK: - Published data
    @Published var data = IAPTestData()

// MARK: - Methods
    func viewOnAppear() {
        self.data.productsModels = IAPManager.shared.getAllProducts()
            .compactMap { ProductModel(withSKProduct: $0) }
    }
    
    func onClickProductWithId(_ id: String) {
        IAPManager.shared.buyOneScreenshootProtocol()
    }
    
}
