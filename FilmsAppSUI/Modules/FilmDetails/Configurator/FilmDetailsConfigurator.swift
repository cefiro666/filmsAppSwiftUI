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
final class FilmDetailsConfigurator: IConfigurator {
        
// MARK: - Methods
    func createScreen(_ data: Any?) -> UIViewController {
        let view = FilmDetailsView()
        let router = FilmDetailsRouter()
        
        view.presenter.setFilm(data as? Film)
        view.presenter.router = router
        view.presenter.view = view
        
        return UIHostingController<ContainerView<FilmDetailsView>>(rootView: ContainerView(content: view))
    }
    
}
