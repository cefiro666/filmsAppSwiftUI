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
       
// MARK: - Properties
    var view: FilmDetailsView<FilmDetailsPresenterImpl>!
    
// MARK: - Methods
    func createScreen<Content: View&Presentable>(withView view: Content,
                                                 configureBlock: ((Content?) -> ())?) -> UIViewController {
        
        self.view = view as? FilmDetailsView<FilmDetailsPresenterImpl>
        let router = FilmDetailsRouterImpl()

        self.view.presenter.router = router
        self.view.presenter.view = self.view
        
        configureBlock?(self.view as? Content)
        
        return UIHostingController<ContainerView<FilmDetailsView>>(rootView: ContainerView(content: self.view))
    }
    
}
