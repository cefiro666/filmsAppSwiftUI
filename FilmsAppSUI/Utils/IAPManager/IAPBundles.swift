//
//  IAppBundles.swift
//  FilmsAppSUI
//
//  Created by Виталий Баник on 23.10.2020.
//  Copyright © 2020 Виталий Баник. All rights reserved.
//

import Foundation
import SQStoreKit

// MARK: - IAPBundles
    enum TestIAPBundle: String, CaseIterable, IAPBundle {

        case oneScreenshootProtocol

        func productId() -> String {
            return Bundle.main.bundleIdentifier?.appending(".\(self.rawValue)") ?? ""
        }
        
        static func allIds() -> [String] {
            return TestIAPBundle.allCases.map { Bundle.main.bundleIdentifier?.appending(".\($0.rawValue)") ?? "" }
        }
    }
