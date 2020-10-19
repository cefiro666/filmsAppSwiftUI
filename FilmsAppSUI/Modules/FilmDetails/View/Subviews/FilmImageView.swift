//
//  FilmImageView.swift
//  FilmsAppSUI
//
//  Created by Виталий Баник on 18.09.2020.
//  Copyright © 2020 Виталий Баник. All rights reserved.
//

import SwiftUI

// MARK: - FilmImageView
struct FilmImageView: View {
    
// MARK: - Properties
    var imageUrl: String
    
// MARK: - Body
    var body: some View {
        NetworkImage(urlString: self.imageUrl)
            .frame(width: UIScreen.main.bounds.width / 2.5, height: 170, alignment: .center)
    }
}

// MARK: - PreviewProvider
struct FilmImageView_Previews: PreviewProvider {
    
    static var previews: some View {
        FilmImageView(imageUrl: "https://www.apple.com/favicon.ico")
    }
}
