//
//  FilmDetailsPresenter.swift
//  FilmsAppSUI
//
//  Created by Виталий Баник on 08.09.2020.
//  Copyright © 2020 Виталий Баник. All rights reserved.
//

import Foundation

// MARK: - IFilmDetailsPresenter
protocol IFilmDetailsPresenter: IPresenter {
    
    var output: IFilmDetailsView? { get set }
    func setData(data: FilmDetailsData?)
}

// MARK: - FilmDetailsPresenter
class FilmDetailsPresenter: IFilmDetailsPresenter {
    
// MARK: - Output
    lazy var output: IFilmDetailsView? = nil
    
// MARK: - setData
    func setData(data: FilmDetailsData?) {
        guard let film = data?.film else { return }
        let filmModel = self.getModelFromFilm(film)
        self.output?.updateModel(data: filmModel)
    }
    
// MARK: - showErrorMessage
    func showErrorMessage(_ message: String?) {
        self.output?.showErrorMessage(message)
    }
    
// MARK: - setLoadingVisible
    func setLoadingVisible(_ visible: Bool) {
        self.output?.setLoadingVisible(visible)
    }
    
// MARK: - Methods
    private func getModelFromFilm(_ film: Film) -> FilmModel {
        return FilmModel(id: String(film.id),
                         localizedName: film.localizedName,
                         year: film.year,
                         name: film.name,
                         rating: film.rating,
                         imageURL: film.imageURL,
                         filmDescription: film.filmDescription,
                         genres: film.genres)
    }
}
