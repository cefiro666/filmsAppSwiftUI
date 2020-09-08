//
//  FilmDetailsInteractor.swift
//  FilmsAppSUI
//
//  Created by Виталий Баник on 08.09.2020.
//  Copyright © 2020 Виталий Баник. All rights reserved.
//

import Foundation

// MARK: - IFilmDetailsInteractor
protocol IFilmDetailsInteractor: class {
    
    func setFilm(_ film: Film?) -> Self
    func onAppear()
}

// MARK: - FilmDetailsInteractor
final class FilmDetailsInteractor: IFilmDetailsInteractor {
    
// MARK: - Output
    var output: IFilmDetailsPresenter?
    
// MARK: - Data
    private var data = FilmDetailsData()
    
// MARK: - Methods
    func setFilm(_ film: Film?) -> Self {
        self.data.film = film
        return self
    }
    
    func onAppear() {
        self.output?.setData(data: self.data)
    }
    
}
