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
    
    associatedtype ViewType: Presentable
    
    var view: ViewType? { get set }
    var router: FilmDetailsRouter? { get set }
    var data: FilmDetailsData { get }
    
    func setFilm(_ film: Film?)
}

// MARK: - FilmDetailsPresenterImpl
final class FilmDetailsPresenterImpl: FilmDetailsPresenter {
    
    typealias ViewType = FilmDetailsView
    
// MARK: - Properties
    var view: FilmDetailsView<FilmDetailsPresenterImpl>?
    var router: FilmDetailsRouter?

    var container: Container?
    
// MARK: - Data
    @Published var data = FilmDetailsData()
        
// MARK: - Methods
    func setFilm(_ film: Film?) {
        self.data.filmModel = FilmModel(film: film ?? Film.placeholder)
    }
    
}
