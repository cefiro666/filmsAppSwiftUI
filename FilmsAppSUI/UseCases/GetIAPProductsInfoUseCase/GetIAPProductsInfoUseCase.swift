//
//  GetIAPProductsInfoUseCase.swift
//  FilmsAppSUI
//
//  Created by Виталий Баник on 26.10.2020.
//  Copyright © 2020 Виталий Баник. All rights reserved.
//

import SQStoreKit

// MARK: - GetFilmsUseCaseImpl
class GetIAPProductsInfoUseCaseImpl: GetIAPProductsInfoUseCase {
    
// MARK: - Methods
    func execute(_ completionHandler: @escaping (_ success: Bool, _ productsInfo: IAPProductsInfo?, _ errorMessage: String?) -> ()) {
        let productsInfo = IAPProductsInfo(productsIdentifiers: ["oneScreenshootProtocol"], sharedSecret: nil)
        completionHandler(true, productsInfo, nil)
    }
    
}
