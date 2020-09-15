//
//  FilmDetailsView.swift
//  FilmsAppSUI
//
//  Created by Виталий Баник on 04.09.2020.
//  Copyright © 2020 Виталий Баник. All rights reserved.
//

import SwiftUI

// MARK: - IFilmDetailsView
protocol IFilmDetailsView: Presentable {
    
}

// MARK: - FilmDetailsView
struct FilmDetailsView: View {
    
// MARK: - Properties
    @ObservedObject var presenter = FilmDetailsPresenter()

// MARK: -  body
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                HStack(spacing: 20.0) {
                    self.filmImage
                    self.filmInfo
                }
                .padding(.horizontal)
                .frame(minWidth: UIScreen.main.bounds.width, alignment: .leading)
                
                self.genres
                
                Text(self.getModelFromFilm(self.presenter.data.film).filmDescription ?? "Описание отсутствует")
                    .padding(.horizontal)
                    .padding(.bottom)
            }
            .padding(.top)
            
        }.navigationBarTitle(Text(self.getModelFromFilm(self.presenter.data.film).localizedName ?? ""),
                             displayMode: .large)
    }
    
// MARK: - filmImage
    private var filmImage: some View {
        NetworkImage(urlString: self.getModelFromFilm(self.presenter.data.film).imageURL)
            .frame(width: UIScreen.main.bounds.width / 2.5,
                   height: 170,
                   alignment: .center).onTapGesture {
                
//            if URL(string: self.model.filmModel.imageURL ?? "") == nil { return }
//            self.urlString = self.model.filmModel.imageURL ?? ""
//            self.needShowViewer.toggle()
        }
    }
    
// MARK: - filmInfo
    private var filmInfo: some View {
        VStack(alignment: .leading, spacing: 8.0) {
            
            Text(self.getModelFromFilm(self.presenter.data.film).name ?? "")
                .id(self.getModelFromFilm(self.presenter.data.film).name.hashValue)
            
            Text("Год: \(String(self.getModelFromFilm(self.presenter.data.film).year ?? 0))")
            
            HStack(spacing: .zero) {
                Text("Рейтинг: ")
                Text.fromRaiting(self.getModelFromFilm(self.presenter.data.film).rating)
            }
        }
    }
    
// MARK: - genres
    private var genres: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                Spacer(minLength: 15.0)
                ForEach(self.getModelFromFilm(self.presenter.data.film).genres, id: \.hashValue) { genre in
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

// MARK: - IFilmDetailsView
extension FilmDetailsView: IFilmDetailsView {
    
    var iPresenter: IPresenter? { self.presenter }
}

// MARK: - getModelFromFilm
extension FilmDetailsView {
    
    private func getModelFromFilm(_ film: Film) -> FilmModel {
        return FilmModel(id: String(film.id),
                         localizedName: film.localizedName,
                         year: film.year,
                         name: film.name,
                         rating: film.rating,
                         imageURL: film.imageURL,
                         filmDescription: film.filmDescription,
                         genres: film.genres)
    }
    
}

// MARK: - PreviewProvider
struct FilmDetailCell_Previews: PreviewProvider {
    
    static var previews: some View {
        FilmDetailsView()
    }
    
}
