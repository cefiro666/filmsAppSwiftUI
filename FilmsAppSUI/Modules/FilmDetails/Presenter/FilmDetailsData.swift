//
//  FilmDetailsData.swift
//  FilmsAppSUI
//
//  Created by Виталий Баник on 15.09.2020.
//  Copyright © 2020 Виталий Баник. All rights reserved.
//

import Foundation

// MARK: - FilmDetailsPublicData
struct FilmDetailsPublicData {
    
// MARK: - Published
    var filmModel = FilmModel.placeholder
}

// MARK: - FilmDetailsPrivateData
struct FilmDetailsPrivateData {
    
// MARK: - Properties
    var film: Film?
}
