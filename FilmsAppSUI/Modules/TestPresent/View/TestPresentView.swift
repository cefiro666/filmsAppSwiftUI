//
//  TestPresent.swift
//  filmsAppSwiftUI
//
//  Created by Виталий Баник on 06/10/2020.
//  Copyright © 2020 Sequenia. All rights reserved.
//

import SwiftUI

// MARK: - TestPresentView
struct TestPresentView<Presenter>: View, Presentable, Configurable where Presenter: TestPresentPresenter {
    typealias TestPresentPresenter = TestPresentPresenterImpl
    
// MARK: - Presenter
    @ObservedObject var presenter: TestPresentPresenter
    var configurator: Configurator.Type = TestPresentConfigurator.self
    
// MARK: - Inits
    init() {
        self.presenter = TestPresentPresenterImpl()
    }

// MARK: -  body
    var body: some View {
        Button {
            self.presenter.onTapDismissButton()
        } label: {
            Text("Dismiss!")
        }
    }
}

// MARK: - PreviewProvider
struct TestPresent_Previews: PreviewProvider {
    
    static var previews: some View {
        TestPresentView<TestPresentPresenterImpl>()
    }
}
