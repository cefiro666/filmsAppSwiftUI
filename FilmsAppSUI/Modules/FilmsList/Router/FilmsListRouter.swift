//
//  FilmsListRouter.swift
//  FilmsAppSUI
//
//  Created by Виталий Баник on 09.09.2020.
//  Copyright © 2020 Виталий Баник. All rights reserved.
//

import Foundation

// MARK: - FilmsListRouter
protocol FilmsListRouter {
    
    func pushFilmDetailsScreen(film: Film)
}

// MARK: - FilmsListRouterImpl
class FilmsListRouterImpl: FilmsListRouter {
    
// MARK: - Methods
    func pushFilmDetailsScreen(film: Film) {
        Navigator.shared.push(view: FilmDetailsView(presenter: FilmDetailsPresenterImpl()),
                              title: film.localizedName)
    }
    
}
