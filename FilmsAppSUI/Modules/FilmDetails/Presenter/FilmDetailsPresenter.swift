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
    
    var view: Presentable? { get set }
    var router: IFilmDetailsRouter? { get set }
    var data: FilmDetailsData { get }
    
    func setFilm(_ film: Film?)
}

// MARK: - FilmDetailsPresenter
final class FilmDetailsPresenter: ObservableObject, IFilmDetailsPresenter {
    
// MARK: - Properties
    lazy var view: Presentable? = nil
    var router: IFilmDetailsRouter?

    var listener: IContainer?
    
// MARK: - Data
    @Published var data = FilmDetailsData()
        
// MARK: - Methods
    func setFilm(_ film: Film?) {
        if let film = film {
            self.data.filmModel = FilmModel(film: film)
        }
    }
    
}
