//
//  FilmsListVewModel.swift
//  FilmsAppSUI
//
//  Created by Виталий Баник on 28.08.2020.
//  Copyright © 2020 Виталий Баник. All rights reserved.
//

import SwiftUI

// MARK: - FilmsListViewModel
final class FilmsListViewModel: ObservableObject, IViewModel {
    
// MARK: - Properties
    @Published var sections: [SectionModel] = []
    @Published var genres: [String] = []
    
    var listener: IContainer?
    
// MARK: - update
    func update(data: Any?) {
        if let sections = data as? [SectionModel] {
            self.sections = sections
        }
        
        if let genres = data as? [String] {
            self.genres = genres
        }
    }
    
}
