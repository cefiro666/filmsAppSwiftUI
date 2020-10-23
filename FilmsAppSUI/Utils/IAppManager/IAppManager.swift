//
//  InAppManager.swift
//  FilmsAppSUI
//
//  Created by Виталий Баник on 23.10.2020.
//  Copyright © 2020 Виталий Баник. All rights reserved.
//

import SQStoreKit
import Foundation

// MARK: - IAPBundles
class IAPManager {
    
// MARK: - IAPBundles
    enum IAPBundles: String, CaseIterable, ProductIdentifier {

        case oneScreenshootProtocol

        func productId() -> String {
            return Bundle.main.bundleIdentifier?.appending(".\(self.rawValue)") ?? ""
        }
        
        static func allIDs() -> [String] {
            return IAPBundles.allCases.map { Bundle.main.bundleIdentifier?.appending(".\($0.rawValue)") ?? "" }
        }
    }
    
// MARK: - Shared
    static var shared = IAPManager()
    
// MARK: - Private init
    private init() {
        SQStoreKit.shared.initWithProductsEnum(IAPBundles.self)
    }
}
