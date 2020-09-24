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
    var clickHandler: ((String) -> ())?

// MARK: - body
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                Spacer(minLength: 14.0)
                
                ForEach(self.genres, id: \.hashValue) { genre in
                    Button(action: {
                        self.clickHandler?(genre)
                    }) {
                        GenreView(genre: genre)
                    }.disabled(clickHandler == nil)
                }
                
                Spacer(minLength: 14.0)
            }
        }
    }
}

// MARK: - PreviewProvider
struct FilmsListGenresView_Previews: PreviewProvider {
    
    static var previews: some View {
        GenresView(genres: ["1", "2", "3"])
    }
}
