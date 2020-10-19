//
//  FilmDetailsPresenter.swift
//  FilmsAppSUI
//
//  Created by Виталий Баник on 08.09.2020.
//  Copyright © 2020 Виталий Баник. All rights reserved.
//

import Foundation

// MARK: - FilmDetailsPresenter
protocol FilmDetailsPresenter: Presenter {
    
    var router: FilmDetailsRouter? { get set }
    var data: FilmDetailsData { get }
    
    func setFilm(_ film: Film?)
    func viewOnAppear()
}

// MARK: - FilmDetailsPresenterImpl
final class FilmDetailsPresenterImpl: FilmDetailsPresenter {
    
// MARK: - Vuper
    var router: FilmDetailsRouter?
    weak var container: Container?
    
// MARK: - Published data
    @Published var data = FilmDetailsData()
    
// MARK: - Private data
    private var film: Film?
        
// MARK: - Methods
    func setFilm(_ film: Film?) {
        self.film = film
        self.data.filmModel = FilmModel(film: film ?? Film.placeholder)
    }
    
    func viewOnAppear() {
        self.data.filmModel = FilmModel(film: self.film ?? Film.placeholder)
    }
    
}
