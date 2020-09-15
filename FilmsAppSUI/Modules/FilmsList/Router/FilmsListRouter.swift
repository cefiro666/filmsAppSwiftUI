//
//  FilmsListRouter.swift
//  FilmsAppSUI
//
//  Created by Виталий Баник on 09.09.2020.
//  Copyright © 2020 Виталий Баник. All rights reserved.
//

import Foundation

// MARK: - IFilmsListRouter
protocol IFilmsListRouter {
    
    func pushFilmDetailsScreen(film: Film)
}

// MARK: - FilmsListRouter
class FilmsListRouter: IFilmsListRouter {
    
// MARK: - Methods
    func pushFilmDetailsScreen(film: Film) {
        Navigator.shared.push(screen: FilmDetailsView.self, data: film)
    }
    
}
