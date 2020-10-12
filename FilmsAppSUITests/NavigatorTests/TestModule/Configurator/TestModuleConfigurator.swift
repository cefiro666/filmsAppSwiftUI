//
//  TestModule.swift
//  filmsAppSwiftUI
//
//  Created by Виталий Баник on 06/10/2020.
//  Copyright © 2020 Sequenia. All rights reserved.
//

import SwiftUI
import UIKit

// MARK: - TestModuleConfigurator
final class TestModuleConfigurator: Configurator {
       
// MARK: - Methods
    static func createScreen<Content: View & Presentable>(withView view: Content,
                                                          configureBlock: ((Content?) -> ())?) -> UIViewController {
        
        guard let view = view as? TestModuleView<TestModulePresenterImpl> else { return UIViewController() }
        let router = TestModuleRouterImpl()

        view.presenter.router = router
        
        configureBlock?(view as? Content)
        
        return UIHostingController<ContainerView<TestModuleView>>(rootView: ContainerView(content: view))
    }
    
}
