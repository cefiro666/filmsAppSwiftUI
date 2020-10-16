//
//  Pushing.swift
//  filmsAppSwiftUI
//
//  Created by Виталий Баник on 15/10/2020.
//  Copyright © 2020 Sequenia. All rights reserved.
//

import SwiftUI
import UIKit

// MARK: - PushingConfigurator
struct PushingConfigurator: Configurator {
       
// MARK: - Methods
    static func createScreen(configureBlock: ((PushingView?) -> ())?) -> UIViewController {
        let view = PushingView()

        view.presenter.router = PushingRouterImpl()
        
        configureBlock?(view)
        
        return UIHostingController<ContainerView<PushingView>>(rootView: ContainerView(content: view))
    }
    
}
