//
//  TestingTab.swift
//  filmsAppSwiftUI
//
//  Created by Виталий Баник on 15/10/2020.
//  Copyright © 2020 Sequenia. All rights reserved.
//

import SwiftUI
import UIKit

// MARK: - TestingTabConfigurator
struct TestingTabConfigurator: Configurator {
       
// MARK: - Methods
    static func createScreen<Content: Contentable>(withView view: Content,
                                                   configureBlock: ((Content?) -> ())?) -> UIViewController {
        
        guard let view = view as? TestingTabView else { fatalError("view does not comply with protocol") }

        view.presenter.router = TestingTabRouterImpl()
        
        configureBlock?(view as? Content)
        
        return UIHostingController<ContainerView<TestingTabView>>(rootView: ContainerView(content: view))
    }
    
}