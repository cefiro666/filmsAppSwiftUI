//
//  FilmDetailsViewModel.swift
//  FilmsAppSUI
//
//  Created by Виталий Баник on 08.09.2020.
//  Copyright © 2020 Виталий Баник. All rights reserved.
//

import SwiftUI

// MARK: - FilmDetailsViewModel
final class FilmDetailsViewModel: ObservableObject, IViewModel {
    
// MARK: - Properties
    @Published var filmModel = FilmModel.placeholder
    
    var listener: IContainer?
    
    
// MARK: - update
    func update(data: Any?) {
        if let filmModel = data as? FilmModel {
            self.filmModel = filmModel
        }
    }
    
}

