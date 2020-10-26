//
//  InAppManager.swift
//  FilmsAppSUI
//
//  Created by Виталий Баник on 23.10.2020.
//  Copyright © 2020 Виталий Баник. All rights reserved.
//

import StoreKit
import SQStoreKit
import UIKit

// MARK: - IAPBundles
class IAPManager {
  
// MARK: - Properties
    private var activityView: ActivityView?
    fileprivate var delegates = [WeakDelegateContainer]()
    
// MARK: - Shared
    static var shared = IAPManager()
    private init() {}
    
// MARK: - Init manager
    static func initManager() {
        SQStoreKit.shared.getIAPProductsInfoUseCase = GetIAPProductsInfoUseCaseImpl()
        SQStoreKit.shared.uiDelegate = IAPManager.shared
        SQStoreKit.shared.delegate = IAPManager.shared
        SQStoreKit.shared.loadProducts()
    }
    
// MARK: - Delegates
    func addDelegate(_ delegate: IAPManagerDelegate) {
        let weakContainer = WeakDelegateContainer()
        weakContainer.weakDelegate = delegate
        self.delegates.append(weakContainer)
    }
    
    func removeDelegate(_ delegate: IAPManagerDelegate) {
        let delegate = self.delegates.first(where: { $0.weakDelegate === delegate })
        self.delegates.removeAll() { $0 === delegate }
    }
    
// MARK: - Public methods
    func getAllProducts() -> [ProductModel] {
        return SQStoreKit.shared.getProducts().compactMap { ProductModel(withSKProduct: $0) }
    }
    
    func buyProductWithIdentifier(_ id: String) {
        SQStoreKit.shared.purchaseProduct(id)
    }
    
// MARK: - Private methods
    private func needShowActivity(_ needShow: Bool) {
        if needShow {
            if let scene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
               let viewController = scene.windows.first?.rootViewController {
                
                self.activityView = ActivityView.create(on: viewController)
            }
        } else {
            self.activityView?.remove()
        }
    }
}

// MARK: - SQStoreKitUIDelegate
extension IAPManager: SQStoreKitUIDelegate {
    
    func willStartLongProcess() {
        self.needShowActivity(true)
    }
    
    func didFinishLongProcess() {
        self.needShowActivity(false)
    }
    
}

// MARK: - SQStoreKitDelegate
extension IAPManager: SQStoreKitDelegate {
    
    func didPurchaseProduct(_ product: SKProduct, store: SQStoreKit) {
        for delegate in self.delegates {
            delegate.weakDelegate?.didPurchaseProduct(ProductModel(withSKProduct: product))
        }
    }
    
    func didRestoreProduct(_ product: SKProduct, store: SQStoreKit) {
        for delegate in self.delegates {
            delegate.weakDelegate?.didRestoreProduct(ProductModel(withSKProduct: product))
        }
    }
    
    func didUpdateProductsList(_ productsList: [SKProduct], store: SQStoreKit) {
        for delegate in self.delegates {
            delegate.weakDelegate?.didUpdateProductsList(productsList.map { ProductModel(withSKProduct: $0) })
        }
    }
    
    func updateProductsListError(_ error: Error, store: SQStoreKit) {
        for delegate in self.delegates {
            delegate.weakDelegate?.updateProductsListError(error)
        }
    }
    
    func purchaseProductError(_ error: Error, store: SQStoreKit) {
        for delegate in self.delegates {
            delegate.weakDelegate?.purchaseProductError(error)
        }
    }
    
    func restoreProductError(_ error: Error, store: SQStoreKit) {
        for delegate in self.delegates {
            delegate.weakDelegate?.restoreProductError(error)
        }
    }
    
    func purchaseProductCanceled(_ error: Error, store: SQStoreKit) {
        for delegate in self.delegates {
            delegate.weakDelegate?.purchaseProductCanceled(error)
        }
    }
    
    func willPurchaseProduct(_ product: SKProduct, store: SQStoreKit) {
        for delegate in self.delegates {
            delegate.weakDelegate?.willPurchaseProduct(ProductModel(withSKProduct: product))
        }
    }
    
    func didRestoreOldProduct(_ productIdentifire: String, store: SQStoreKit) {
        for delegate in self.delegates {
            delegate.weakDelegate?.didRestoreOldProduct(productIdentifire)
        }
    }
    
}
