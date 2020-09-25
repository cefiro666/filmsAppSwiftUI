//
//  FilmsListView.swift
//  FilmsAppSUI
//
//  Created by Виталий Баник on 28.08.2020.
//  Copyright © 2020 Виталий Баник. All rights reserved.
//

import SwiftUI

// MARK: - FilmsListView
struct FilmsListView<Presenter>: View, Presentable, Configurable where Presenter: FilmsListPresenter {
    
// MARK: - Presenter
    @ObservedObject var presenter: Presenter
    var configurator: Configurator = FilmsListConfigurator()
    
    @State var genresFilterShowed = false
    
// MARK: - Body
    var body: some View {
        ZStack {
            FilmsTableView(sections: self.getSectionsFromData( ), clickHandler: { filmId in
                self.setGenresFilterVisible(false)
                self.presenter.onClickFilmWithId(filmId)
                
            }).onTapGesture {
                self.setGenresFilterVisible(false)
            }

            if genresFilterShowed {
                FilterByGenresView(genres: self.presenter.data.genres) { genre in
                    self.presenter.onClickGenre(genre)
                }
            }
            
            FilterButtonView(clickHandler: {
                self.setGenresFilterVisible(self.genresFilterShowed ? false : true)
            })
        }

        .navigationBarTitle(Text("films"))
        .onAppear {
            self.presenter.viewOnAppear()
        }
    }
    
// MARK: - Methods
    private func setGenresFilterVisible(_ visible: Bool) {
        withAnimation {
            self.genresFilterShowed = visible
        }
    }
    
    private func getSectionsFromData() -> [SectionModel] {
        var secions = [SectionModel]()
        let yearsSet = Set<Int>(self.presenter.data.filmsModels.compactMap { $0.year })
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
        FilmsListView(presenter: FilmsListPresenterImpl())
    }
}
