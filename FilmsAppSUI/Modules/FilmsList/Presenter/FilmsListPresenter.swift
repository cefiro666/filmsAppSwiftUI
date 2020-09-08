//
//  FilmsListPresenter.swift
//  FilmsAppSUI
//
//  Created by Виталий Баник on 07.09.2020.
//  Copyright © 2020 Виталий Баник. All rights reserved.
//

import Foundation

// MARK: - Constants
fileprivate struct Constants {

    static let kAllGenres = "Все"
}

// MARK: - IFilmsListPresenter
protocol IFilmsListPresenter: IPresenter {
    
    var output: IFilmsListView? { get set }
    func setData(data: FilmsListData?)
}

// MARK: - FilmsListPresenter
class FilmsListPresenter: IFilmsListPresenter {
    
// MARK: - Output
    lazy var output: IFilmsListView? = nil
    
// MARK: - setData
    func setData(data: FilmsListData?) {
        guard let data = data else { return }
    
        let sections = self.getSectionsFrom(data.isFilter ? data.filteredFilms : data.films)
        self.output?.updateModel(data: sections)
        
        var genres = Array(Set(data.films.flatMap { $0.genres })).sorted()
        genres.insert(Constants.kAllGenres, at: .zero)
        self.output?.updateModel(data: genres)
    }
    
// MARK: - showErrorMessage
    func showErrorMessage(_ message: String?) {
        self.output?.showErrorMessage(message)
    }
    
// MARK: - setLoadingVisible
    func setLoadingVisible(_ visible: Bool) {
        self.output?.setLoadingVisible(visible)
    }
    
// MARK: - Methods
    private func getSectionsFrom(_ films: [Film]) -> [SectionModel] {
        var secions = [SectionModel]()
        let yearsSet = Set<Int>(films.compactMap { $0.year }).sorted().reversed()
        for year in yearsSet {
            let stringYear = String(year)
            let sameYearsSection = SectionModel(id: stringYear)
            sameYearsSection.header = HeaderModel(id: stringYear, title: stringYear)
            sameYearsSection.elements = films
                .filter { $0.year == year }
                .map { film in

                    FilmModel(id: String(film.id),
                              localizedName: film.localizedName,
                              year: film.year,
                              name: film.name,
                              rating: film.rating,
                              imageURL: film.imageURL,
                              filmDescription: film.filmDescription,
                              genres: film.genres)
            }

            secions.append(sameYearsSection)
        }
        
        return secions
    }
    
}
