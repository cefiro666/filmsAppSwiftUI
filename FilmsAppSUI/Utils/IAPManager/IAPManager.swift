//
//  InAppManager.swift
//  FilmsAppSUI
//
//  Created by Виталий Баник on 23.10.2020.
//  Copyright © 2020 Виталий Баник. All rights reserved.
//

import StoreKit
import SQStoreKit
import Foundation

protocol IAPManagerProtocol: class {
    
    static func initManager()
    func getAllProducts() -> [SKProduct]
    func buyOneScreenshootProtocol()
}

// MARK: - IAPBundles
class IAPManager: IAPManagerProtocol {
    
// MARK: - Shared
    static var shared = IAPManager()
    private init() {}
    
// MARK: - Private init
    static func initManager() {
        SQStoreKit.shared.initWithProductsEnum(IAPBundles.self)
    }
    
    func getAllProducts() -> [SKProduct] {
        return SQStoreKit.shared.getProducts()
    }
    
    func buyOneScreenshootProtocol() {
        SQStoreKit.shared.purchaseProduct(IAPBundles.oneScreenshootProtocol)
    }
}
