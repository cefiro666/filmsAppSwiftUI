//
//  SplashScreen.swift
//  filmsAppSwiftUI
//
//  Created by Виталий Баник on 15/10/2020.
//  Copyright © 2020 Sequenia. All rights reserved.
//

import SwiftUI
import UIKit

// MARK: - SplashScreenConfigurator
struct SplashScreenConfigurator: Configurator {
       
// MARK: - Methods
    static func createScreen(configureBlock: ((SplashScreenView?) -> ())?) -> UIViewController {
        let view = SplashScreenView()

        view.presenter.router = SplashScreenRouterImpl()
        
        configureBlock?(view)
        
        return UIHostingController<ContainerView<SplashScreenView>>(rootView: ContainerView(content: view))
    }
    
}
