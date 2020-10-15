//
//  FilmGenreView.swift
//  FilmsAppSUI
//
//  Created by Виталий Баник on 19.09.2020.
//  Copyright © 2020 Виталий Баник. All rights reserved.
//

import SwiftUI

// MARK: - FilmGenreView
struct FilmGenreView: View {
    
// MARK: - Properties
    var genre: String
    var isSelectedGenre = false
    
// MARK: - body
    var body: some View {
        Text(self.genre.capitalized(with: nil))
            .foregroundColor(.white)
            .font(.subheadline)
            .padding(5.0)
            .eraseToAnyView()
            .background(self.isSelectedGenre ? Color(#colorLiteral(red: 0.7450980544, green: 0.1568627506, blue: 0.07450980693, alpha: 1)) : Color(#colorLiteral(red: 0.3333333433, green: 0.3333333433, blue: 0.3333333433, alpha: 1)))
            .cornerRadius(10.0)
    }
}

// MARK: - PreviewProvider
struct FilmGenreView_Previews: PreviewProvider {
    
    static var previews: some View {
        FilmGenreView(genre: "genre")
    }
}
