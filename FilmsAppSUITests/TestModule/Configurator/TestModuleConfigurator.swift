//
//  TestModule.swift
//  filmsAppSwiftUI
//
//  Created by Виталий Баник on 06/10/2020.
//  Copyright © 2020 Sequenia. All rights reserved.
//

import SwiftUI
import UIKit
@testable import FilmsAppSUI

// MARK: - TestModuleConfigurator
final class TestModuleConfigurator: Configurator {
       
// MARK: - Methods
    static func createScreen(configureBlock: ((TestModuleView?) -> ())?) -> UIViewController {
        let view = TestModuleView()

        view.presenter.router = TestModuleRouterImpl()
        
        configureBlock?(view)
        
        return UIHostingController<ContainerView<TestModuleView>>(rootView: ContainerView(content: view))
    }
    
}
