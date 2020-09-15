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
    
// MARK: - Published
    var genres: [String] = []
    var films: [Film] = []
    
// MARK: - Properties
    var sourceFilms: [Film] = []
}

// норм ли хранить в одном классе данные для отображения во вью и сырые, которые не для отображения
