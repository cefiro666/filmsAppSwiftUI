//
//  Test.swift
//  filmsAppSwiftUI
//
//  Created by Виталий Баник on 05/10/2020.
//  Copyright © 2020 Sequenia. All rights reserved.
//

import SwiftUI

// MARK: - TestView
struct TestView: View, Presentable, Configurable {
    
// MARK: - Properties
    @ObservedObject var presenter = TestPresenterImpl()
    let configurator: Configurator.Type = TestConfigurator.self
    
// MARK: - Body
    var body: some View {
        Text("Sequenia. SwiftUI VUPER")
            .onTapGesture {
                self.presenter.onClickText()
            }
    }
}

// MARK: - PreviewProvider
struct Test_Previews: PreviewProvider {
    
    static var previews: some View {
        TestView()
    }
}
