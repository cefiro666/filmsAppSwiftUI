//
//  FilmInfoView.swift
//  FilmsAppSUI
//
//  Created by Виталий Баник on 18.09.2020.
//  Copyright © 2020 Виталий Баник. All rights reserved.
//

import SwiftUI

// MARK: - FilmInfoView
struct FilmInfoView: View {
    
// MARK: - Properties
    var name: String
    var year: Int
    var rating: Float?
    
// MARK: - body
    var body: some View {
        VStack(alignment: .leading, spacing: 8.0) {
            
            Text(self.name)
                .id(self.name.hashValue)
            
            Text("Год: \(String(self.year))")
            
            HStack(spacing: .zero) {
                Text("Рейтинг: ")
                Text.fromRaiting(self.rating)
            }
        }
    }
}

// MARK: - PreviewProvider
struct FilmInfoView_Previews: PreviewProvider {
    
    static var previews: some View {
        FilmInfoView(name: "name", year: 2020, rating: 7.777)
    }
}
