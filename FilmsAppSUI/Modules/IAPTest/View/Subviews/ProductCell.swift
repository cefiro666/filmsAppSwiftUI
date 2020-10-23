//
//  ProductCell.swift
//  FilmsAppSUI
//
//  Created by Виталий Баник on 23.10.2020.
//  Copyright © 2020 Виталий Баник. All rights reserved.
//

import SwiftUI

// MARK: - ProductCell
struct ProductCell: View {
    
// MARK: - Properties
    var productModel: ProductModel
    
// MARK: - Body
    var body: some View {
        HStack(alignment: .top) {
            VStack(alignment: .leading) {
                Text(productModel.title ?? "")
                
                Text(productModel.description ?? "")
                    .font(Font.subheadline)
                    .foregroundColor(.gray)
            }
            
            Spacer()
            
            Text(productModel.price ?? "")
        }

        .padding()
        .background(Color(.systemBackground))
    }
}

// MARK: - PreviewProvider
struct ProductCell_Previews: PreviewProvider {
    static var previews: some View {
        ProductCell(productModel: ProductModel.placeholder)
    }
}
