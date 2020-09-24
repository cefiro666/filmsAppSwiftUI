//
//  FilmDetailsView.swift
//  FilmsAppSUI
//
//  Created by Виталий Баник on 04.09.2020.
//  Copyright © 2020 Виталий Баник. All rights reserved.
//

import SwiftUI

// MARK: - FilmDetailsView
struct FilmDetailsView<Presenter>: View, Presentable, Configurable where Presenter: FilmDetailsPresenter {
    
// MARK: - Presenter
    @ObservedObject var presenter: Presenter
    var configurator: Configurator = FilmDetailsConfigurator()

// MARK: -  body
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                HStack(spacing: 20.0) {
                    FilmImageView(imageUrl: self.presenter.data.filmModel.imageURL ?? "")
                    FilmInfoView(name: self.presenter.data.filmModel.name ?? "",
                                 year: self.presenter.data.filmModel.year ?? 0,
                                 rating: self.presenter.data.filmModel.rating)
                }
                    
                .padding(.horizontal)
                .frame(minWidth: UIScreen.main.bounds.width, alignment: .leading)
                
                GenresView(genres: self.presenter.data.filmModel.genres)
                    .padding(.vertical, 10.0)
                
                Text(self.presenter.data.filmModel.filmDescription ?? "Описание отсутствует")
                    .padding(.horizontal)
                    .padding(.bottom)
            }
                
            .padding(.top, 20.0)
        }
    }
}

// MARK: - PreviewProvider
struct FilmDetailCell_Previews: PreviewProvider {
    
    static var previews: some View {
        FilmDetailsView(presenter: FilmDetailsPresenterImpl())
    }
}
