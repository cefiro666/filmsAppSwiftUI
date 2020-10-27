//
//  GetIAPProductsInfoUseCase.swift
//  FilmsAppSUI
//
//  Created by Виталий Баник on 26.10.2020.
//  Copyright © 2020 Виталий Баник. All rights reserved.
//

import SQStoreKit
import Foundation

// MARK: - GetFilmsUseCaseImpl
class GetIAPProductsInfoUseCaseImpl: GetIAPProductsInfoUseCase {
    
// MARK: - Methods
    func execute(_ completionHandler: @escaping (_ success: Bool, _ productsInfo: IAPProductsInfo?, _ errorMessage: String?) -> ()) {
        if let bundle = Bundle.main.bundleIdentifier {
            let IAPBundles = [
                "oneScreenshootProtocol"
            ]
            
            let productsInfo = IAPProductsInfo(productsIdentifiers: IAPBundles.map { "\(bundle).\($0)" }, sharedSecret: nil)
            completionHandler(true, productsInfo, nil)
            return
        }
        
        completionHandler(false, nil, "Invalid bundle!")
    }
    
}
