//
//  IAPTest.swift
//  filmsAppSwiftUI
//
//  Created by Виталий Баник on 23/10/2020.
//  Copyright © 2020 Sequenia. All rights reserved.
//

import SwiftUI

// MARK: - IAPTestView
struct IAPTestView: Contentable {

// MARK: - Vuper
    @ObservedObject var presenter = IAPTestPresenterImpl()
    static let configurator = IAPTestConfigurator.self

// MARK: - Body
    var body: some View {
        ZStack {
            if #available(iOS 14.0, *) {
                ScrollView {
                    LazyVStack() {
                        self.productsModels
                    }
                    
                    Spacer(minLength: 14.0)
                        .background(Color.clear)
                }
            } else {
                List {
                    self.productsModels
                }
            }
        }
        
        .onAppear {
            self.presenter.viewOnAppear()
        }
    }
    
    var productsModels: some View {
        ForEach(self.presenter.data.productsModels) { productModel in
            ProductCell(productModel: productModel)
                .onTapGesture {
                    self.presenter.onClickProductWithId(productModel.id)
                }
        }
    }
}

// MARK: - PreviewProvider
struct IAPTest_Previews: PreviewProvider {
    
    static var previews: some View {
        IAPTestView()
    }
}
