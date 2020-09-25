//
//  FilterByGenresView.swift
//  FilmsAppSUI
//
//  Created by Виталий Баник on 24.09.2020.
//  Copyright © 2020 Виталий Баник. All rights reserved.
//

import SwiftUI

// MARK: - FilterByGenresView
struct FilterByGenresView: View {
    
// MARK: - Properties
    var genres: [String]
    var clickHandler: ((String) -> ())?
    
// MARK: - body
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            Spacer(minLength: 16.0)
            
            VStack {
                ForEach(self.genres, id: \.hashValue) { genre in
                    Button(action: {
                        self.clickHandler?(genre)
                    }) {
                        FilmGenreView(genre: genre)
                    }
                }
            }
            
            Spacer(minLength: 16.0)
        }
        
        .frame(width: UIScreen.main.bounds.width * 0.6, height: UIScreen.main.bounds.height * 0.5)
        .background(Color.init(.sRGB, white: .zero, opacity: 0.8))
        .cornerRadius(10.0)
    }
}

// MARK: - PreviewProvider
struct FilterByGenresView_Previews: PreviewProvider {
    static var previews: some View {
        FilterByGenresView(genres: ["1", "2", "3"])
    }
}
