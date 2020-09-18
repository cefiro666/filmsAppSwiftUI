//
//  FilmDetailsData.swift
//  FilmsAppSUI
//
//  Created by Виталий Баник on 15.09.2020.
//  Copyright © 2020 Виталий Баник. All rights reserved.
//

import SwiftUI

// MARK: - FilmDetailsData
struct FilmDetailsData {
    
// MARK: - Published
    var filmModel = FilmModel(id: String(Film.placeholder.id),
                              localizedName: Film.placeholder.localizedName,
                              year: Film.placeholder.year,
                              name: Film.placeholder.name,
                              rating: Film.placeholder.rating,
                              imageURL: Film.placeholder.imageURL,
                              filmDescription: Film.placeholder.filmDescription,
                              genres: Film.placeholder.genres)
}
