//
//  FilmsListInteractor.swift
//  FilmsAppSUI
//
//  Created by Виталий Баник on 07.09.2020.
//  Copyright © 2020 Виталий Баник. All rights reserved.
//

import Foundation

// MARK: - IFilmsListInteractor
protocol IFilmsListInteractor: class {
    
    func getFilms()
    func onClickGenre(_ genre: String)
    func getFilmWithId(_ id: String) -> Film?
}

// MARK: - FilmsListInteractor
final class FilmsListInteractor: IFilmsListInteractor {
    
// MARK: - Output
    var output: IFilmsListPresenter?
    
// MARK: - Data
    private var data = FilmsListData()
    
// MARK: - UseCases
    private var getFilmsUseCase: GetFilmsUseCase?
    
    func setUseCase<T>(_ useCase: T) -> Self {
        switch useCase {
        case is GetFilmsUseCase:
            self.getFilmsUseCase = useCase as? GetFilmsUseCase
            
        default:
            break
        }
        
        return self
    }
    
// MARK: - Methods
    func onClickGenre(_ genre: String) {
        if !self.data.films.flatMap({ $0.genres }).contains(genre) {
            self.data.isFilter = false
            self.output?.setData(data: self.data)
            return
        }
        
        self.data.isFilter = true
        self.data.filteredFilms = self.data.films.filter { $0.genres.contains(genre) }
        self.output?.setData(data: self.data)
    }
    
    func getFilms() {
        self.output?.setLoadingVisible(true)
        self.getFilmsUseCase?.execute(completion: { [weak self] (success, films, errorMessage) in
            self?.output?.setLoadingVisible(false)
            if !success {
                self?.output?.showErrorMessage(errorMessage)
                return
            }
            
            self?.data.films = films
            self?.output?.setData(data: self?.data)
        })
    }
    
    func getFilmWithId(_ id: String) -> Film? {
        return self.data.films.first(where: { $0.id == Int(id) })
    }
    
}
