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
    func createScreen() -> UIViewController {
        self.view = FilmDetailsView(presenter: FilmDetailsPresenterImpl())
        let router = FilmDetailsRouterImpl()

        self.view.presenter.router = router
        self.view.presenter.view = self.view
        
//        configureBlock?(self as? Configurator)
        
        return UIHostingController<ContainerView<FilmDetailsView>>(rootView: ContainerView(content: self.view))
    }
    
    func setFilm(film: Film) {
        self.view.presenter.setFilm(film)
    }
    
}
