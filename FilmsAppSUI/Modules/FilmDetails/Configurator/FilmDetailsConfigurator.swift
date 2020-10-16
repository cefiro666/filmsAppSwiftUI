//
//  FilmDetailsConfigurator.swift
//  FilmsAppSUI
//
//  Created by Виталий Баник on 08.09.2020.
//  Copyright © 2020 Виталий Баник. All rights reserved.
//

import SwiftUI
import UIKit

// MARK: - FilmDetailsConfigurator
struct FilmDetailsConfigurator: Configurator {
       
// MARK: - Methods
    static func createScreen(configureBlock: ((FilmDetailsView?) -> ())?) -> UIViewController {
        let view = FilmDetailsView()

        view.presenter.router = FilmDetailsRouterImpl()
        
        configureBlock?(view)
        
        return UIHostingController<ContainerView<FilmDetailsView>>(rootView: ContainerView(content: view))
    }
    
}
