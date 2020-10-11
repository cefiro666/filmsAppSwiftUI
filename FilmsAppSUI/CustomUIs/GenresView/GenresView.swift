//
//  GenresView.swift
//  FilmsAppSUI
//
//  Created by Виталий Баник on 18.09.2020.
//  Copyright © 2020 Виталий Баник. All rights reserved.
//

import SwiftUI

// MARK: - GenresView
struct GenresView: View {
    
// MARK: - Properties
    var genres: [String]
    var selectedGenre: String?
    var clickHandler: ((String) -> ())?

// MARK: - body
    var body: some View {
        if self.genres.isEmpty {
            EmptyView()
        } else {
            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    Spacer(minLength: 18.0)
                    
                    ForEach(self.genres, id: \.hashValue) { genre in
                        Button(action: {
                            self.clickHandler?(genre)
                        }, label: {
                            FilmGenreView(genre: genre, isSelectedGenre: genre == self.selectedGenre)
                        }).disabled(self.clickHandler == nil)
                    }
                    
                    Spacer(minLength: 18.0)
                }
            }
        }
    }
}

// MARK: - PreviewProvider
struct GenresView_Previews: PreviewProvider {
    
    static var previews: some View {
        GenresView(genres: ["1", "2", "3"])
    }
}
