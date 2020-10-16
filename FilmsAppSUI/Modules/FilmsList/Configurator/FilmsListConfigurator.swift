//
//  FilmsListConfigurator.swift
//  FilmsAppSUI
//
//  Created by Виталий Баник on 07.09.2020.
//  Copyright © 2020 Виталий Баник. All rights reserved.
//

import SwiftUI
import UIKit

// MARK: - FilmsListConfigurator
struct FilmsListConfigurator: Configurator {
    
// MARK: - Methods
    static func createScreen(configureBlock: ((FilmsListView?) -> ())?) -> UIViewController {
        let view = FilmsListView()
        
        view.presenter.router = FilmsListRouterImpl()

        view.presenter.setUseCase(GetFilmsUseCaseImpl())
        
        configureBlock?(view)
        
        return UIHostingController<ContainerView<FilmsListView>>(rootView: ContainerView(content: view))
    }
    
}
