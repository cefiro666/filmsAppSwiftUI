//
//  FilmsListView.swift
//  FilmsAppSUI
//
//  Created by Виталий Баник on 28.08.2020.
//  Copyright © 2020 Виталий Баник. All rights reserved.
//

import SwiftUI

// MARK: - FilmsListView
struct FilmsListView: Contentable {
    
// MARK: - Properties
    @ObservedObject var presenter = FilmsListPresenterImpl()
    let configurator: Configurator.Type = FilmsListConfigurator.self
    
// MARK: - Body
    var body: some View {
        VStack {
            Spacer(minLength: 16.0)
            
            GenresView(genres: self.presenter.data.genres,
                       selectedGenre: self.presenter.data.selectedGenre,
                       clickHandler: { genre in
                        
                withAnimation {
                    self.presenter.onClickGenre(genre)
                }
            })
            
            if self.presenter.data.isDownloadFilmFromSelectedGenre {
                VStack {
                    Spacer()
                    
                    LottieView(name: "loading", loopMode: .loop)
                        .frame(width: UIScreen.main.bounds.width * 0.7, height: UIScreen.main.bounds.width * 0.7)
                    
                    Spacer()
                }
            } else {
                FilmsTableView(sections: self.getSections(), clickHandler: { filmId in
                    self.presenter.onClickFilmWithId(filmId)
                })
            }
        }

        .onAppear {
            self.presenter.viewOnAppear()
        }
    }
    
// MARK: - Methods
    private func getSections() -> [SectionModel] {
        var secions = [SectionModel]()
        let yearsSet = self.presenter.data.filmsModels
            .compactMap { $0.year }
            .unique { $0 }
            .sorted()
            .reversed()
        
        for year in yearsSet {
            let stringYear = String(year)
            let sameYearsSection = SectionModel(id: stringYear)
            sameYearsSection.header = HeaderModel(id: stringYear, title: stringYear)
            sameYearsSection.elements = self.presenter.data.filmsModels
                .filter { $0.year == year }

            secions.append(sameYearsSection)
        }

        return secions
    }
}

// MARK: - PreviewProvider
struct FilmsListView_Previews: PreviewProvider {

    static var previews: some View {
        FilmsListView()
    }
}
