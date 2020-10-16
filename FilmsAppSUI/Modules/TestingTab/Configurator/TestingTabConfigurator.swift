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
    static func createScreen(configureBlock: ((TestingTabView?) -> ())?) -> UIViewController {
        let view = TestingTabView()

        view.presenter.router = TestingTabRouterImpl()
        
        configureBlock?(view)
        
        return UIHostingController<ContainerView<TestingTabView>>(rootView: ContainerView(content: view))
    }
    
}
