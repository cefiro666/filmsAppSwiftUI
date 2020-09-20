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
    
// MARK: - FilmsListGenresView
    var genres: [String]
    var leftRightSpace: CGFloat = .zero
    var clickHandler: ((String) -> ())?

// MARK: - FilmsListGenresView
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                Spacer(minLength: self.leftRightSpace)
                
                ForEach(self.genres, id: \.hashValue) { genre in
                    Button(action: {
                        self.clickHandler?(genre)
                    }) {
                        GenreView(genre: genre)
                    }.disabled(self.clickHandler == nil)
                }
                
                Spacer(minLength: self.leftRightSpace)
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
