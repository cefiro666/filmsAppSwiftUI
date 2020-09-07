//
//  FilmsListVewModel.swift
//  FilmsAppSUI
//
//  Created by Виталий Баник on 28.08.2020.
//  Copyright © 2020 Виталий Баник. All rights reserved.
//

import Foundation
import Combine

// MARK: - Constants
fileprivate struct Constants {
    
    static let kAllGenres = "Все"
}

// MARK: - FilmsListViewModel
enum FilmsListViewState {
    
    case loading
    case error(_ error: Error)
    case filmsLoaded(_ sections: [SectionModel])
}

// MARK: - FilmsListViewModel
final class FilmsListViewModel: ObservableObject {
    
// MARK: - Data
    @Published var state: FilmsListViewState = .loading
    @Published var genres: [String] = []
    
    private var films: [Film] = []
    
// MARK: - Network
    private var network = FilmsNetwork(environment: .films)

// MARK: - Life cycle
    func onAppear() {
        self.loadFilms()
    }
    
    func onClickGenre(_ genre: String) {
        if genre == Constants.kAllGenres {
            self.state = .filmsLoaded(self.getSectionsFrom(self.films))
            return
        }
        let films = self.films.filter { $0.genres.contains(genre) }
        self.state = .filmsLoaded(self.getSectionsFrom(films))
    }
    
// MARK: - Methods
    private func loadFilms() {
        self.state = .loading
        
        (self.network.fetch(route: FilmsRoute.getFilms) as AnyPublisher<FilmsResponse, Error>)
            .receive(on: RunLoop.main)
            .sink(receiveCompletion: { completion in
                switch completion {
                case .failure(let error):
                    self.state = .error(error)
                    
                default:
                    break
                }
                
            }, receiveValue: { decodable in
                self.films = decodable.films
                self.genres = Array(Set(decodable.films.flatMap { $0.genres }))
                self.genres.insert(Constants.kAllGenres, at: 0)
                
                self.state = .filmsLoaded(self.getSectionsFrom(decodable.films))
            })
            .store(in: &bag)
    }
    
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
    
// MARK: - Bag
    private var bag = Set<AnyCancellable>()
    
}
