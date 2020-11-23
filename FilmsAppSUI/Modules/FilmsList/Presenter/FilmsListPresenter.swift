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
    var publicData: FilmsListData { get }
    
    func viewOnAppear()
    func onClickGenre(_ genre: String)
    func onClickFilmWithId(_ id: String)
}

// MARK: - FilmsListPresenterImpl
final class FilmsListPresenterImpl {
        
// MARK: - Vuper
    var router: FilmsListRouter?
    weak var container: Container?
    
// MARK: - Published Data
    @Published var publicData = FilmsListData()
    
// MARK: - Private Data
    private var privateData = FilmsListPrivateData()
    
// MARK: - Use cases
    var useCases: FilmsListUseCases?
    
// MARK: - Methods
    private func getFilms() {
        self.container?.setLoadingVisible(true)
        self.useCases?.getFilms.execute(completion: { [weak self] (success, films, errorMessage) in
            self?.container?.setLoadingVisible(false)
            if !success {
                self?.container?.showErrorMessage(errorMessage) {
                    self?.getFilms()
                }
                return
            }
            
            self?.privateData.films = films
            self?.publicData.filmsModels = films.map { FilmModel(film: $0) }
            self?.configureGenres()
        })
    }
    
    private func configureGenres() {
        var genres = self.privateData.films.flatMap { $0.genres }
            .unique { $0 }
            .sorted()

        genres.insert(Constants.kAllGenres, at: .zero)
        self.publicData.genres = genres
        self.publicData.selectedGenre = Constants.kAllGenres
    }
    
}

// MARK: - FilmsListPresenter
extension FilmsListPresenterImpl: FilmsListPresenter {
    
// MARK: - Methods
    func viewOnAppear() {
        if self.privateData.films.isEmpty {
            self.getFilms()
        }
    }
    
    func onClickGenre(_ genre: String) {
        self.publicData.selectedGenre = genre
        self.publicData.isLoadingFilmsWithSelectedGenre = true
        
        // simulated long downloading films from selected genre (for show sample activity view)
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
     
            self.publicData.isLoadingFilmsWithSelectedGenre = false
            
            if genre == Constants.kAllGenres {
                self.publicData.filmsModels = self.privateData.films.map { FilmModel(film: $0) }
                return
            }
            
            self.publicData.filmsModels = self.privateData.films
                .map { FilmModel(film: $0) }
                .filter { $0.genres.contains(genre) }
        }
    }
    
    func onClickFilmWithId(_ id: String) {
        guard let film = self.privateData.films.first(where: { $0.id == Int(id) }) else { return }
        self.router?.pushFilmDetailsScreenForFilm(film)
    }
}
