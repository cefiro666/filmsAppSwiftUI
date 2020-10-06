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
    
// MARK: - Presenter
    @ObservedObject var presenter: Presenter
    var configurator: Configurator = TestConfigurator()

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
        TestView(presenter: TestPresenterImpl())
    }
}
