//
//  FilmsListRouter.swift
//  FilmsAppSUI
//
//  Created by Виталий Баник on 09.09.2020.
//  Copyright © 2020 Виталий Баник. All rights reserved.
//

import Foundation

// MARK: - FilmsListRouter
protocol FilmsListRouter: Router {
    
    func pushFilmDetailsScreenForFilm(_ film: Film)
    func showSortingParameters(selectParameter: SortingParameter, _ completion: ((SortingParameter) -> ())?)
}

// MARK: - FilmsListRouterImpl
struct FilmsListRouterImpl: FilmsListRouter {
    
// MARK: - Methods
    func pushFilmDetailsScreenForFilm(_ film: Film) {
        self.pushScreenWithHidenTabBar(view: FilmDetailsView.self, title: film.localizedName) { view in
            view?.presenter.setFilm(film)
        }
    }
    
    func showSortingParameters(selectParameter: SortingParameter, _ completion: ((SortingParameter) -> ())?) {
        self.showPopupScreen(view: SortingParametersView.self, height: 160.0) { view in
            view?.presenter.setSelectParameter(selectParameter)
            view?.presenter.setChangeSortingParameterCompletion(completion)
        }
    }
    
}
