//
//  TestModule.swift
//  filmsAppSwiftUI
//
//  Created by Виталий Баник on 06/10/2020.
//  Copyright © 2020 Sequenia. All rights reserved.
//

import SwiftUI

// MARK: - TestModuleView
struct TestModuleView<Presenter>: View, Presentable, Configurable where Presenter: TestModulePresenter {
    
// MARK: - Presenter
    @ObservedObject var presenter: Presenter
    var configurator: Configurator.Type = TestModuleConfigurator.self

// MARK: -  body
    var body: some View {
        Text("Sequenia. SwiftUI VUPER")
            .onAppear() {
                self.presenter.viewOnAppear()
        }
    }
}

// MARK: - PreviewProvider
struct TestModule_Previews: PreviewProvider {
    
    static var previews: some View {
        TestModuleView(presenter: TestModulePresenterImpl())
    }
}
