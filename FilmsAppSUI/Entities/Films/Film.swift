//
//  Film.swift
//  FilmsAppSUI
//
//  Created by Виталий Баник on 28.08.2020.
//  Copyright © 2020 Виталий Баник. All rights reserved.
//

import Foundation

//MARK: - Film
struct Film: Codable {
    
//MARK: - Properties
    var id: Int
    var localizedName: String
    var name: String
    var year: Int
    var rating: Float?
    var imageURL: String?
    var filmDescription: String?
    var genres: [String]

//MARK: - CodingKeys
    enum CodingKeys: String, CodingKey {
        
        case id, name, year, rating, genres
        case localizedName = "localized_name"
        case imageURL = "image_url"
        case filmDescription = "description"
    }
    
//MARK: - placeholder
    static var placeholder: Self {
        return Film(id: 0,
                    localizedName: "Film localized name",
                    name: "Film name",
                    year: 1996,
                    rating: 7.777,
                    imageURL: nil,
                    filmDescription: "Film description",
                    genres: ["комедия", "боевик", "фентези"])
    }
    
}
