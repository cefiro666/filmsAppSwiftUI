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
    convenience init(id: String,
                     localizedName: String?,
                     year: Int?,
                     name: String?,
                     rating: Float?,
                     imageURL: String?,
                     filmDescription: String?,
                     genres: [String]) {
        
        self.init(id: id)
        
        self.localizedName = localizedName
        self.year = year
        self.name = name
        self.rating = rating
        self.imageURL = imageURL
        self.filmDescription = filmDescription
        self.genres = genres
    }
    
//MARK: - placeholder
    static var placeholder: FilmModel {
        return FilmModel(id: String(Film.placeholder.id),
                         localizedName: Film.placeholder.localizedName,
                         year: Film.placeholder.year,
                         name: Film.placeholder.name,
                         rating: Film.placeholder.rating,
                         imageURL: Film.placeholder.imageURL,
                         filmDescription: Film.placeholder.filmDescription,
                         genres: Film.placeholder.genres)
    }
    
}
