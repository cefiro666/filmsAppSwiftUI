//
//  TestPresent.swift
//  filmsAppSwiftUI
//
//  Created by Виталий Баник on 06/10/2020.
//  Copyright © 2020 Sequenia. All rights reserved.
//

import SwiftUI

// MARK: - TestPresentView
struct TestPresentView: View, Presentable, Configurable {
    
// MARK: - Presenter
    @ObservedObject var presenter = TestPresentPresenterImpl()
    let configurator: Configurator.Type = TestPresentConfigurator.self

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
        TestPresentView()
    }
}
