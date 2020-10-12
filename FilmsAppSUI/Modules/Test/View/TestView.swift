//
//  Test.swift
//  filmsAppSwiftUI
//
//  Created by Виталий Баник on 05/10/2020.
//  Copyright © 2020 Sequenia. All rights reserved.
//

import SwiftUI

// MARK: - TestView
struct TestView<Presenter>: View, Presentable, Configurable where Presenter: TestPresenter {
    typealias TestPresenter = TestPresenterImpl
    
// MARK: - Presenter
    @ObservedObject var presenter: TestPresenter
    var configurator: Configurator.Type = TestConfigurator.self

// MARK: - Inits
    init() {
        self.presenter = TestPresenterImpl()
    }
    
// MARK: -  body
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
        TestView<TestPresenterImpl>()
    }
}
