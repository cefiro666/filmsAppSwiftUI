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

// MARK: - IFilmsListPresenter
protocol IFilmsListPresenter: IPresenter {
    
    var view: IFilmsListView? { get set }
    var router: IFilmsListRouter? { get set }
    var data: FilmsListData { get }
    
    func viewOnAppear()
    func onClickGenre(_ genre: String)
    func onClickFilmWithId(_ id: String)
}

// MARK: - FilmsListPresenter
final class FilmsListPresenter: ObservableObject, IFilmsListPresenter {
    
// MARK: - Properties
    lazy var view: IFilmsListView? = nil
    var router: IFilmsListRouter?

    var listener: IContainer?
    
// MARK: - Data
    @Published var data = FilmsListData()
    
// MARK: - UseCases
    private var getFilmsUseCase: GetFilmsUseCase?
    
    func setUseCase(_ useCase: Any?) -> Self {
        switch useCase {
        case is GetFilmsUseCase:
            self.getFilmsUseCase = useCase as? GetFilmsUseCase
            
        default:
            break
        }
        
        return self
    }
    
// MARK: - Methods
    func viewOnAppear() {
        if self.data.sourceFilms.isEmpty {
            self.getFilms()
        }
    }
    
    func onClickGenre(_ genre: String) {
        if genre == Constants.kAllGenres {
            self.data.films = self.data.sourceFilms
            return
        }
        
        self.data.films = self.data.sourceFilms.filter { $0.genres.contains(genre) }
    }
    
    func onClickFilmWithId(_ id: String) {
        guard let film = self.data.films.first(where: { $0.id == Int(id) }) else { return }
        self.router?.pushFilmDetailsScreen(film: film)
    }
    
    func onClickError() {
        self.getFilms()
    }
    
    private func getFilms() {
        self.view?.setLoadingVisible(true)
        self.getFilmsUseCase?.execute(completion: { [weak self] (success, films, errorMessage) in
            self?.view?.setLoadingVisible(false)
            if !success {
                self?.view?.showErrorMessage("Похоже, что-то пошло не так. Попробуйте снова.")
                return
            }
            
            self?.data.sourceFilms = films
            self?.data.films = films
            self?.configureGenres()
        })
    }
    
    private func configureGenres() {
        var genres = Array(Set(self.data.films.flatMap { $0.genres })).sorted()
        genres.insert(Constants.kAllGenres, at: .zero)
        self.data.genres = genres
    }
    
}
