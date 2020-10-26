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
        IAPManager.shared.addDelegate(self)
        self.data.productsModels = IAPManager.shared.getAllProducts()
    }
    
    func onClickProductWithId(_ id: String) {
        IAPManager.shared.buyProductWithIdentifier(id)
    }
    
// MARK: - Deinit
    deinit {
        IAPManager.shared.removeDelegate(self)
    }
    
}

// MARK: - IAPManagerDelegate
extension IAPTestPresenterImpl: IAPManagerDelegate {
    
    func didPurchaseProduct(_ productModel: ProductModel) {
        
    }
    
    func didRestoreProduct(_ productModel: ProductModel) {
        
    }
    
    func didUpdateProductsList(_ productsModels: [ProductModel]) {
        self.data.productsModels = productsModels
    }
    
}
