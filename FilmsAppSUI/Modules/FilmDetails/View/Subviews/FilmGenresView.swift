//
//  FilmGenresView.swift
//  FilmsAppSUI
//
//  Created by Виталий Баник on 18.09.2020.
//  Copyright © 2020 Виталий Баник. All rights reserved.
//

import SwiftUI

// MARK: - FilmGenresView
struct FilmGenresView: View {
    
// MARK: - Properties
    var genres: [String]

// MARK: - body
    var body: some View {
        if self.genres.isEmpty {
            EmptyView()
        } else {
            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    Spacer(minLength: 14.0)
                    
                    ForEach(self.genres, id: \.hashValue) { genre in
                        FilmGenreView(genre: genre)
                    }
                    
                    Spacer(minLength: 14.0)
                }
            }
        }
    }
}

// MARK: - PreviewProvider
struct FilmGenresView_Previews: PreviewProvider {
    
    static var previews: some View {
        FilmGenresView(genres: ["1", "2", "3"])
    }
}
