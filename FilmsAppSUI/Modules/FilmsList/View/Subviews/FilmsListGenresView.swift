//
//  FilmsListGenresView.swift
//  FilmsAppSUI
//
//  Created by Виталий Баник on 18.09.2020.
//  Copyright © 2020 Виталий Баник. All rights reserved.
//

import SwiftUI

// MARK: - FilmsListGenresView
struct FilmsListGenresView: View {
    
// MARK: - FilmsListGenresView
    var genres: [String]
    var clickHandler: ((String) -> ())?

// MARK: - FilmsListGenresView
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                ForEach(self.genres, id: \.hashValue) { genre in
                    Button(action: {
                        self.clickHandler?(genre)
                    }) {
                        Text(genre.capitalized(with: nil))
                        .foregroundColor(Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)))
                        .font(.subheadline)
                        .padding(5.0)
                        .eraseToAnyView()
                        .background(Color(#colorLiteral(red: 0.7450980544, green: 0.1568627506, blue: 0.07450980693, alpha: 1)))
                        .cornerRadius(10.0)
                    }
                }
            }
        }
    }
}

struct FilmsListGenresView_Previews: PreviewProvider {
    
    static var previews: some View {
        FilmsListGenresView(genres: ["1", "2", "3"])
    }
}
