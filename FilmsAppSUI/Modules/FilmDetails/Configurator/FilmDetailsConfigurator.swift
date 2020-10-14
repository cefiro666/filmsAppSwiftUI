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
    static func createScreen<Content: Contentable>(withView view: Content,
                                                   configureBlock: ((Content?) -> ())?) -> UIViewController {
        
        guard let view = view as? FilmDetailsView else { fatalError("view does not comply with protocol") }
 
        view.presenter.router = FilmDetailsRouterImpl()
        
        configureBlock?(view as? Content)
        
        return UIHostingController<ContainerView<FilmDetailsView>>(rootView: ContainerView(content: view))
    }
    
}
