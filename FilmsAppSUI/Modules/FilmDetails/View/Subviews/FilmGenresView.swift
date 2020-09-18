//
//  FilmGenresView.swift
//  FilmsAppSUI
//
//  Created by Виталий Баник on 18.09.2020.
//  Copyright © 2020 Виталий Баник. All rights reserved.
//

import SwiftUI

// MARK: - Properties
struct FilmGenresView: View {
    
// MARK: - Properties
    var genres: [String]

// MARK: - body
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                Spacer(minLength: 15.0)
                ForEach(self.genres, id: \.hashValue) { genre in
                    Text(genre.capitalized(with: nil))
                        .foregroundColor(Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)))
                        .font(.subheadline)
                        .padding(5.0)
                        .eraseToAnyView()
                        .background(Color(#colorLiteral(red: 0.7450980544, green: 0.1568627506, blue: 0.07450980693, alpha: 1)))
                        .cornerRadius(10.0)
                }
                
                Spacer(minLength: 15.0)
            }
        }.padding(.vertical)
    }
}

// MARK: - PreviewProvider
struct FilmGenresView_Previews: PreviewProvider {
    
    static var previews: some View {
        FilmGenresView(genres: ["1", "2", "3"])
    }
}
