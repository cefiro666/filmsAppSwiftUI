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

protocol IAPManagerProtocol: class {
    
    static func initManager()
    func getAllProducts() -> [ProductModel]
    func buyProductWithIdentifier(_ id: String)
}

// MARK: - IAPBundles
class IAPManager: IAPManagerProtocol {
  
// MARK: - Properties
    private var activityView: ActivityView?
    
// MARK: - Shared
    static var shared = IAPManager()
    private init() {
        SQStoreKit.shared.uiDelegate = self
    }
    
// MARK: - Private init
    static func initManager() {
        SQStoreKit.shared.initWithProductsEnum(TestIAPBundle.self)
    }
    
    func getAllProducts() -> [ProductModel] {
        return SQStoreKit.shared.getProducts().compactMap { ProductModel(withSKProduct: $0) }
    }
    
    func buyProductWithIdentifier(_ id: String) {
        SQStoreKit.shared.purchaseProduct(id)
    }
}

// MARK: - SQStoreKitUIDelegate
extension IAPManager: SQStoreKitUIDelegate {
    
    func acivityViewWillAppear() {
        if let viewController = (UIApplication.shared.connectedScenes.first as? UIWindowScene)?.windows.first?.rootViewController {
            
            self.activityView = ActivityView.create(on: viewController)
        }
    }
    
    func acivityViewWillDisappear() {
        self.activityView?.remove()
    }
    
}
