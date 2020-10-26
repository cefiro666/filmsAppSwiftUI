//
//  IAPManagerDelegate.swift
//  FilmsAppSUI
//
//  Created by Виталий Баник on 26.10.2020.
//  Copyright © 2020 Виталий Баник. All rights reserved.
//

import Foundation

// MARK: - IAPBundles
protocol IAPManagerDelegate: class {
    
    func didPurchaseProduct(_ productModel: ProductModel)
    func didRestoreProduct(_ productModel: ProductModel)
    func didUpdateProductsList(_ productsModels: [ProductModel])
    func updateProductsListError(_ error: Error)
    func purchaseProductError(_ error: Error)
    func restoreProductError(_ error: Error)
    func purchaseProductCanceled(_ error: Error)
    func willPurchaseProduct(_ productModel: ProductModel)
    func didRestoreOldProduct(_ productIdentifire: String)
}
 
// MARK: - IAPManagerDelegate implementation
extension IAPManagerDelegate {
    
    func didUpdateProductsList(_ productsModels: [ProductModel]) {}
    func updateProductsListError(_ error: Error) {}
    func purchaseProductError(_ error: Error) {}
    func restoreProductError(_ error: Error) {}
    func purchaseProductCanceled(_ error: Error) {}
    func willPurchaseProduct(_ productModel: ProductModel) {}
    func didRestoreOldProduct(_ productIdentifire: String) {}
}

// MARK: - WeakDelegateContainer
class WeakDelegateContainer {
    
    weak var weakDelegate: IAPManagerDelegate?
}
