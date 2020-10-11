//
//  FilmModel.swift
//  FilmsAppSUI
//
//  Created by Виталий Баник on 28.08.2020.
//  Copyright © 2020 Виталий Баник. All rights reserved.
//

import Foundation

// MARK: - FilmModel
class FilmModel: RowModel {
   
// MARK: - Properties
    var localizedName: String?
    var year: Int?
    var name: String?
    var rating: Float?
    var imageURL: String?
    var filmDescription: String?
    var genres: [String] = []
    
// MARK: - Inits
    convenience init(film: Film) {
        self.init(id: String(film.id))
        
        self.localizedName = film.localizedName
        self.year = film.year
        self.name = film.name
        self.rating = film.rating
        self.imageURL = film.imageURL
        self.filmDescription = film.filmDescription
        self.genres = film.genres
    }
    
//MARK: - placeholder
    static var placeholder: FilmModel {
        return FilmModel(film: Film.placeholder)
    }
    
}
