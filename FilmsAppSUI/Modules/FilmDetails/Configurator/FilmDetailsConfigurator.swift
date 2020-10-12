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
final class FilmDetailsConfigurator: Configurator {
       
// MARK: - Methods
    static func createScreen<Content: View & Presentable>(withView view: Content,
                                                          configureBlock: ((Content?) -> ())?) -> UIViewController {
        
        guard let view = view as? FilmDetailsView else { return UIViewController() }
        let router = FilmDetailsRouterImpl()

        view.presenter.router = router
        view.presenter.view = view
        
        configureBlock?(view as? Content)
        
        return UIHostingController<ContainerView<FilmDetailsView>>(rootView: ContainerView(content: view))
    }
    
}
