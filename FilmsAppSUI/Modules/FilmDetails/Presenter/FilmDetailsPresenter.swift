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
    var publicData: FilmDetailsPublicData { get }
    
    func setFilm(_ film: Film?)
    func viewOnAppear()
}

// MARK: - FilmDetailsPresenterImpl
final class FilmDetailsPresenterImpl {
    
// MARK: - Vuper
    var router: FilmDetailsRouter?
    weak var container: Container?
    
// MARK: - Public data
    @Published var publicData = FilmDetailsPublicData()
    
// MARK: - Private data
    private var privateData = FilmDetailsPrivateData()
}

// MARK: - FilmDetailsPresenter
extension FilmDetailsPresenterImpl: FilmDetailsPresenter {
    
// MARK: - Methods
    func setFilm(_ film: Film?) {
        self.privateData.film = film
        self.publicData.filmModel = FilmModel(film: film ?? Film.placeholder)
    }
    
    func viewOnAppear() {
        self.publicData.filmModel = FilmModel(film: self.privateData.film ?? Film.placeholder)
    }
}
