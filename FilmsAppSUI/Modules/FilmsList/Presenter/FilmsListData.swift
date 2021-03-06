//
//  FilmsListData.swift
//  FilmsAppSUI
//
//  Created by Виталий Баник on 08.09.2020.
//  Copyright © 2020 Виталий Баник. All rights reserved.
//

import Foundation

// MARK: - FilmsListData
struct FilmsListPublicData {
    
// MARK: - Properties
    var genres: [String] = []
    var selectedGenre: String = ""
    var filmsModels: [FilmModel] = []
    var isLoadingFilmsWithSelectedGenre = false
}

// MARK: - FilmsListPrivateData
struct FilmsListPrivateData {
    
// MARK: - Properties
    var films: [Film] = []
}
