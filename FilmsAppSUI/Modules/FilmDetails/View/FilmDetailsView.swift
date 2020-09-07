//
//  FilmDetailsView.swift
//  FilmsAppSUI
//
//  Created by Виталий Баник on 04.09.2020.
//  Copyright © 2020 Виталий Баник. All rights reserved.
//

import SwiftUI

struct FilmDetailsView: View {
    
// MARK: -  Model
    var filmModel: FilmModel
    
// MARK: -  Properties
    @Binding var needShowViewer: Bool
    @Binding var urlString: String
    
// MARK: -  body
    var body: some View {
        self.content
    }
    
// MARK: -  content
    var content: some View {
        
        ScrollView {
            
            VStack(alignment: .leading) {
                
                HStack(spacing: 20.0) {
                    
                    self.filmImage
                    self.filmInfo
                    
                }
                
                .padding(.horizontal)
                .frame(minWidth: UIScreen.main.bounds.width, alignment: .leading)
                
                self.genres
                
                Text(self.filmModel.filmDescription ?? "Описание отсутствует")
                    .padding(.horizontal)
            }
            
            .padding(.top)
            
        }.navigationBarTitle(Text(self.filmModel.localizedName ?? ""), displayMode: .large)
    }
    
    private var filmImage: some View {
        NetworkImage(urlString: self.filmModel.imageURL)
            .frame(width: UIScreen.main.bounds.width / 2.5,
                   height: 170,
                   alignment: .center).onTapGesture {
                
            if URL(string: self.filmModel.imageURL ?? "") == nil { return }
            self.urlString = self.filmModel.imageURL ?? ""
            self.needShowViewer.toggle()
        }
    }
    
    private var filmInfo: some View {
        VStack(alignment: .leading, spacing: 8.0) {
            
            Text(self.filmModel.name ?? "")
                .id(filmModel.name.hashValue)
            
            Text("Год: \(String(self.filmModel.year ?? 0))")
            
            HStack(spacing: .zero) {
                Text("Рейтинг: ")
                Text.fromRaiting(self.filmModel.rating)
            }
        }
    }
    
    private var genres: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                Spacer(minLength: 15.0)
                ForEach(self.filmModel.genres, id: \.hashValue) { genre in
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
struct FilmDetailCell_Previews: PreviewProvider {
    static var previews: some View {
        FilmDetailsView(filmModel: FilmModel(id: String(Film.placeholder.id),
                                             localizedName: Film.placeholder.localizedName,
                                             year: Film.placeholder.year,
                                             name: Film.placeholder.name,
                                             rating: Film.placeholder.rating,
                                             imageURL: Film.placeholder.imageURL,
                                             filmDescription: Film.placeholder.filmDescription,
                                             genres: Film.placeholder.genres),
                        needShowViewer: Binding(get: { return false }, set: { _ in }),
                        urlString: Binding(get: { return "" }, set: { _ in }))
    }
}

