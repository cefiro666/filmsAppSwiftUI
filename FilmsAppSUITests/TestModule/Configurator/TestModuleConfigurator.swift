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
    static func createScreen<Content: Contentable>(withView view: Content,
                                                   configureBlock: ((Content?) -> ())?) -> UIViewController {
        
        guard let view = view as? TestModuleView else { return UIViewController() }

        view.presenter.router = TestModuleRouterImpl()
        
        configureBlock?(view as? Content)
        
        return UIHostingController<ContainerView<TestModuleView>>(rootView: ContainerView(content: view))
    }
    
}
