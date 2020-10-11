//
//  Models.swift
//  FilmsAppSUI
//
//  Created by Виталий Баник on 04.09.2020.
//  Copyright © 2020 Виталий Баник. All rights reserved.
//

import Foundation

// MARK: - HeaderModel
class HeaderModel: Identifiable {
    
// MARK: - Properties
    var id: String
    var title: String?
    
// MARK: - Inits
    required init(id: String, title: String? = nil) {
        self.id = id
        self.title = title
    }
    
}

// MARK: - RowModel
class RowModel: Identifiable {
    
// MARK: - Properties
    var id: String
    
// MARK: - Inits
    required init(id: String) {
        self.id = id
    }
    
}

// MARK: - SectionModel
class SectionModel: Identifiable {
    
// MARK: - Properties
    var id: String
    var header: HeaderModel?
    var elements: [RowModel] = []
    
// MARK: - Inits
    required init(id: String) {
        self.id = id
    }
    
}
