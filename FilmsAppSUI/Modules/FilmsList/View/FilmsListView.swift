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
    
// MARK: - Vuper
    @ObservedObject var presenter = FilmsListPresenterImpl()
    static let configurator = FilmsListConfigurator.self
    
// MARK: - Body
    var body: some View {
        VStack {
            Spacer(minLength: 16.0)
            
            GenresView(genres: self.presenter.publicData.genres,
                       selectedGenre: self.presenter.publicData.selectedGenre) { genre in
                        
                withAnimation {
                    self.presenter.onClickGenre(genre)
                }
            }
            
            ZStack {
                FilmsTableView(sections: self.getSections()) { filmId in
                    self.presenter.onClickFilmWithId(filmId)
                }
                
                if self.presenter.publicData.isLoadingFilmsWithSelectedGenre {
                    FillSpinnerView()
                }
            }
        }
        
        .onAppear {
            self.presenter.viewOnAppear()
        }
    }
}

// MARK: - PreviewProvider
struct FilmsListView_Previews: PreviewProvider {

    static var previews: some View {
        FilmsListView()
    }
}

// MARK: - Get sections
extension FilmsListView {
    
// MARK: - Methods
    private func getSections() -> [SectionModel] {
        var secions = [SectionModel]()
        let years = self.presenter.publicData.filmsModels.compactMap({ $0.year }).unique { $0 }
        
        for year in years {
            let yearString = String(year)
            let sameYearsSection = SectionModel(id: yearString)
            sameYearsSection.header = HeaderModel(id: yearString, title: yearString)
            sameYearsSection.elements = self.presenter.publicData.filmsModels
                .filter { $0.year == year }

            secions.append(sameYearsSection)
        }

        return secions
    }
    
}
