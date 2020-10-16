//
//  Presenting.swift
//  filmsAppSwiftUI
//
//  Created by Виталий Баник on 15/10/2020.
//  Copyright © 2020 Sequenia. All rights reserved.
//

import SwiftUI
import UIKit

// MARK: - PresentingConfigurator
struct PresentingConfigurator: Configurator {
       
// MARK: - Methods
    static func createScreen(configureBlock: ((PresentingView?) -> ())?) -> UIViewController {
        let view = PresentingView()
        
        view.presenter.router = PresentingRouterImpl()
        
        configureBlock?(view)
        
        return UIHostingController<ContainerView<PresentingView>>(rootView: ContainerView(content: view))
    }
    
}
