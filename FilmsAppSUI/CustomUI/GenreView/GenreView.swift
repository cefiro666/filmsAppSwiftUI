//
//  GenreView.swift
//  FilmsAppSUI
//
//  Created by Виталий Баник on 19.09.2020.
//  Copyright © 2020 Виталий Баник. All rights reserved.
//

import SwiftUI

// MARK: - GenreView
struct GenreView: View {
    
// MARK: - Properties
    var genre: String
    
// MARK: - body
    var body: some View {
        Text(self.genre.capitalized(with: nil))
            .foregroundColor(Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)))
            .font(.subheadline)
            .padding(5.0)
            .eraseToAnyView()
            .background(Color(#colorLiteral(red: 0.7450980544, green: 0.1568627506, blue: 0.07450980693, alpha: 1)))
            .cornerRadius(10.0)
    }
}

// MARK: - PreviewProvider
struct GenreView_Previews: PreviewProvider {
    
    static var previews: some View {
        GenreView(genre: "genre")
    }
}
