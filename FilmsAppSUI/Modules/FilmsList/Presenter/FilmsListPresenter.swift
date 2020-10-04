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
    
    associatedtype ViewType: Presentable
    
    var view: ViewType? { get set }
    var router: FilmsListRouter? { get set }
    var data: FilmsListData { get }
    
    func viewOnAppear()
    func onClickGenre(_ genre: String)
    func onClickFilmWithId(_ id: String)
}

// MARK: - FilmsListPresenterImpl
final class FilmsListPresenterImpl: FilmsListPresenter {
    
// MARK: - Properties
    var view: FilmsListView<FilmsListPresenterImpl>?
    var router: FilmsListRouter?

    var container: Container?
    
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
        self.data.isDownloadFilmFromSelectedGenre = true
        
        // simulated long downloading films from selected genre
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
            withAnimation {
                self.data.isDownloadFilmFromSelectedGenre = false
            }
        }
        
        if genre == Constants.kAllGenres {
            self.data.filmsModels = self.films.map { FilmModel(film: $0) }
            return
        }
        
        self.data.filmsModels = self.films
            .map { FilmModel(film: $0) }
            .filter { $0.genres.contains(genre) }
    }
    
    func onClickFilmWithId(_ id: String) {
        guard let film = self.films.first(where: { $0.id == Int(id) }) else { return }
        self.router?.pushFilmDetailsScreenForFilm(film)
    }
    
    func onClickError() {
        self.getFilms()
    }
    
    private func getFilms() {
        self.view?.setLoadingVisible(true)
        self.getFilmsUseCase?.execute(completion: { [weak self] (success, films, errorMessage) in
            self?.view?.setLoadingVisible(false)
            if !success {
                self?.view?.showErrorMessage(errorMessage)
                return
            }
            
            self?.films = films
            self?.data.filmsModels = films.map { FilmModel(film: $0) }
            self?.configureGenres()
        })
    }
    
    private func configureGenres() {
        var genres = Array(Set(self.films.flatMap { $0.genres })).sorted()
        genres.insert(Constants.kAllGenres, at: .zero)
        self.data.genres = genres
        self.data.selectedGenre = Constants.kAllGenres
    }
    
}
