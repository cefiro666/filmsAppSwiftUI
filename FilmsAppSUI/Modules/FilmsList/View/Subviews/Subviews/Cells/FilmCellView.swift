//
//  FilmCellView.swift
//  FilmsAppSUI
//
//  Created by Виталий Баник on 28.08.2020.
//  Copyright © 2020 Виталий Баник. All rights reserved.
//

import SwiftUI

// MARK: - FilmCellView
struct FilmCellView: View {
    
// MARK: - Properties
    var filmModel: FilmModel
    
// MARK: - Body
    var body: some View {
        if #available(iOS 14.0, *) {
            self.cell.padding(.horizontal)
        } else {
            self.cell
        }
    }
    
    private var cell: some View {
        HStack(alignment: .top) {
            VStack(alignment: .leading, spacing: 6.0) {
                Text(self.filmModel.localizedName ?? "")
                    .foregroundColor(.black)
                    .font(.system(size: 16.0))
                    .lineLimit(nil)

                Text(self.filmModel.name ?? "")
                    .foregroundColor(Color(#colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)))
                    .font(.system(size: 15.0))
                    .fontWeight(.light)
                    .id(self.filmModel.name.hashValue)
            }
            
            Spacer()
            
            Text.fromRaiting(self.filmModel.rating)
        }
            
        .padding()
        .background(Color(#colorLiteral(red: 0.7475681534, green: 0.4965922286, blue: 0.7647058964, alpha: 1)))
        .cornerRadius(10.0)
        .shadow(radius: 3.0)
        
        .eraseToAnyView()
        .padding(.vertical, 2.0)
    }
    
}

// MARK: - FilmCellView_Previews
struct FilmCellView_Previews: PreviewProvider {
    
    static var previews: some View {
        FilmCellView(filmModel: FilmModel.placeholder)
    }
    
}
