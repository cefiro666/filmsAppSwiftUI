//
//  FilmsListPresenter.swift
//  FilmsAppSUI
//
//  Created by Виталий Баник on 07.09.2020.
//  Copyright © 2020 Виталий Баник. All rights reserved.
//

import SwiftUI

// MARK: - Constants
fileprivate struct Constants {

    static let kAllGenres = "Все"
}

// MARK: - FilmsListPresenter
protocol FilmsListPresenter: Presenter {

    var router: FilmsListRouter? { get set }
    var data: FilmsListData { get }
    
    func viewOnAppear()
    func onClickGenre(_ genre: String)
    func onClickFilmWithId(_ id: String)
    func onClickSortingButton()
}

// MARK: - FilmsListPresenterImpl
final class FilmsListPresenterImpl: FilmsListPresenter {
        
// MARK: - Vuper
    var router: FilmsListRouter?
    weak var container: Container?
    
// MARK: - Published Data
    @Published var data = FilmsListData()
    
// MARK: - Private Data
    private var films: [Film] = []
    
// MARK: - UseCases
    private var getFilmsUseCase: GetFilmsUseCase?
    
    func setUseCase(_ useCase: Any?) {
        if let getFilmsUseCase = useCase as? GetFilmsUseCase {
            self.getFilmsUseCase = getFilmsUseCase
        }
    }
    
// MARK: - Methods
    func viewOnAppear() {
        if self.films.isEmpty {
            self.getFilms()
        }
    }
    
    func onClickGenre(_ genre: String) {
        self.data.selectedGenre = genre
        self.data.isLoadingFilmsWithSelectedGenre = true
        
        // simulated long downloading films from selected genre (for show sample activity view)
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
     
            self.data.isLoadingFilmsWithSelectedGenre = false
            
            if genre == Constants.kAllGenres {
                self.data.filmsModels = self.films.map { FilmModel(film: $0) }
                self.sortFilmsModelsWithParameter(self.data.selectSortingParameter)
                return
            }
            
            self.data.filmsModels = self.films
                .map { FilmModel(film: $0) }
                .filter { $0.genres.contains(genre) }
            
            self.sortFilmsModelsWithParameter(self.data.selectSortingParameter)
        }
    }
    
    func onClickFilmWithId(_ id: String) {
        guard let film = self.films.first(where: { $0.id == Int(id) }) else { return }
        self.router?.pushFilmDetailsScreenForFilm(film)
    }
    
    func onClickSortingButton() {
        self.router?.showSortingParameters(selectParameter: self.data.selectSortingParameter) { sortingParameter in
            self.data.selectSortingParameter = sortingParameter
            self.sortFilmsModelsWithParameter(sortingParameter)
        }
    }
    
    private func getFilms() {
        self.container?.setLoadingVisible(true)
        self.getFilmsUseCase?.execute(completion: { [weak self] (success, films, errorMessage) in
            self?.container?.setLoadingVisible(false)
            if !success {
                self?.container?.showErrorMessage(errorMessage) {
                    self?.getFilms()
                }
                return
            }
            
            self?.films = films
            self?.data.filmsModels = films.map { FilmModel(film: $0) }
            self?.configureGenres()
            self?.sortFilmsModelsWithParameter(self?.data.selectSortingParameter)
        })
    }
    
    private func configureGenres() {
        var genres = Array(Set(self.films.flatMap { $0.genres })).sorted()
        genres.insert(Constants.kAllGenres, at: .zero)
        self.data.genres = genres
        self.data.selectedGenre = Constants.kAllGenres
    }
    
    private func sortFilmsModelsWithParameter(_ parameter: SortingParameter?) {
        switch parameter ?? .newFirst {
            case .oldFirst: self.data.filmsModels.sort(by: { ($0.year ?? .zero) < ($1.year ?? .zero) })
            case .newFirst: self.data.filmsModels.sort(by: { ($0.year ?? .zero) > ($1.year ?? .zero) })
        }
    }
    
}
