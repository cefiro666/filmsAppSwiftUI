//
//  Product.swift
//  FilmsAppSUI
//
//  Created by Виталий Баник on 23.10.2020.
//  Copyright © 2020 Виталий Баник. All rights reserved.
//

import Foundation
import StoreKit

// MARK: - ProductModel
class ProductModel: Identifiable {
    
// MARK: - Properties
    var id: String
    var title: String?
    var description: String?
    var price: String?
    
// MARK: - Inits
    init(id: String, title: String?, description: String?, price: String?) {
        self.id = id
        self.title = title
        self.description = description
        self.price = price
    }
    
    init(withSKProduct product: SKProduct) {
        self.id = product.productIdentifier
        self.title = product.localizedTitle
        self.description = product.localizedDescription
        self.price = product.localizedPrice()
    }
    
// MARK: - Placeholder
    static var placeholder: ProductModel {
        return ProductModel(id: "product.identifier",
                            title: "Product title",
                            description: "Product description",
                            price: "$1.99")
    }
}
