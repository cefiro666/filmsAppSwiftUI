//
//  FilmsRoute.swift
//  FilmsAppSUI
//
//  Created by Виталий Баник on 04.09.2020.
//  Copyright © 2020 Виталий Баник. All rights reserved.
//

import Foundation

enum FilmsRoute {
    
    case getFilms
}

extension FilmsRoute: NetworkRoute {

    var path: String {
        switch self {
        case .getFilms:
            return "/sequeniatesttask/films.json"
        }
    }

    var method: NetworkMethod {
        switch self {
        case .getFilms:
            return .get
        }
    }
    
}
