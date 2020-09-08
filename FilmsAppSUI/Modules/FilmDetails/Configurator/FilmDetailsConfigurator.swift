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
    
// MARK: - shared
    static let shared = FilmDetailsConfigurator()
    private init() {}
    
// MARK: - Methods
    func createScreen(_ data: Any?) -> UIViewController {
        var view = FilmDetailsView()
        let presenter = FilmDetailsPresenter()
        let interactor = FilmDetailsInteractor()
        
        interactor.setFilm(data as? Film)
        interactor.output = presenter
        presenter.output = view
        view.output = interactor
        
        return UIHostingController<ContainerView<FilmDetailsView>>(rootView: ContainerView(content: view))
    }
    
}
