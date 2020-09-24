//
//  FilterByGenresView.swift
//  FilmsAppSUI
//
//  Created by Виталий Баник on 24.09.2020.
//  Copyright © 2020 Виталий Баник. All rights reserved.
//

import SwiftUI

struct FilterByGenresView: View {
    
    var genres: [String]
    var clickHandler: ((String) -> ())?
    
    var body: some View {
        VStack {
            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    Spacer(minLength: 14.0)
                    
                    ForEach(self.genres, id: \.hashValue) { genre in
                        Button(action: {
                            self.clickHandler?(genre)
                        }) {
                            FilmGenreView(genre: genre)
                        }
                    }
                    
                    Spacer(minLength: 14.0)
                }
                
                .padding(.vertical)
            }
            
            .background(Color.init(.sRGB, white: .zero, opacity: 0.6))
            
            Spacer()
        }
    }
}

struct FilterByGenresView_Previews: PreviewProvider {
    static var previews: some View {
        FilterByGenresView(genres: ["1", "2", "3"])
    }
}
