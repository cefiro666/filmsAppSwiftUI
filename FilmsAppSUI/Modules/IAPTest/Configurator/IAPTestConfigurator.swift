//
//  IAPTest.swift
//  filmsAppSwiftUI
//
//  Created by Виталий Баник on 23/10/2020.
//  Copyright © 2020 Sequenia. All rights reserved.
//

import SwiftUI
import UIKit

// MARK: - IAPTestConfigurator
struct IAPTestConfigurator: Configurator {
       
// MARK: - Methods
    static func createScreen(configureBlock: ((IAPTestView?) -> ())?) -> UIViewController {
        let view = IAPTestView()

        view.presenter.router = IAPTestRouterImpl()
        
        configureBlock?(view)
        
        return UIHostingController<ContainerView<IAPTestView>>(rootView: ContainerView(content: view))
    }
    
}