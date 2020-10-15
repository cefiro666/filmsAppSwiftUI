//
//  TestModule.swift
//  filmsAppSwiftUI
//
//  Created by Виталий Баник on 06/10/2020.
//  Copyright © 2020 Sequenia. All rights reserved.
//

import SwiftUI
@testable import FilmsAppSUI

// MARK: - TestModuleView
struct TestModuleView: Contentable {
    
// MARK: - Presenter
    @ObservedObject var presenter = TestModulePresenterImpl()
    var configurator: Configurator.Type = TestModuleConfigurator.self

// MARK: -  body
    var body: some View {
        Text("Sequenia. SwiftUI VUPER")
    }
}

// MARK: - PreviewProvider
struct TestModule_Previews: PreviewProvider {
    
    static var previews: some View {
        TestModuleView()
    }
}
