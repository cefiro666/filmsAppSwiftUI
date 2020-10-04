//
//  FilmsListData.swift
//  FilmsAppSUI
//
//  Created by Виталий Баник on 08.09.2020.
//  Copyright © 2020 Виталий Баник. All rights reserved.
//

import SwiftUI

// MARK: - FilmsListData
struct FilmsListData {
    
// MARK: - Properties
    var genres: [String] = []
    var selectedGenre: String = ""
    var filmsModels: [FilmModel] = []
    var isDownloadFilmFromSelectedGenre = false

    var films: [Film] = []
}
