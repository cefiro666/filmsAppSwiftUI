//
//  SortingParameters.swift
//  filmsAppSwiftUI
//
//  Created by Виталий Баник on 16/10/2020.
//  Copyright © 2020 Sequenia. All rights reserved.
//

import SwiftUI
import UIKit

// MARK: - SortingParametersConfigurator
struct SortingParametersConfigurator: Configurator {
       
// MARK: - Methods
    static func createScreen(configureBlock: ((SortingParametersView?) -> ())?) -> UIViewController {
        let view = SortingParametersView()

        view.presenter.router = SortingParametersRouterImpl()
        
        configureBlock?(view)
        
        return UIHostingController<ContainerView<SortingParametersView>>(rootView: ContainerView(content: view))
    }
    
}
