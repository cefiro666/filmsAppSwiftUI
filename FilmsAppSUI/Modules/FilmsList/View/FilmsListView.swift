//
//  FilmsListView.swift
//  FilmsAppSUI
//
//  Created by Виталий Баник on 28.08.2020.
//  Copyright © 2020 Виталий Баник. All rights reserved.
//

import SwiftUI

// MARK: - FilmsListView
struct FilmsListView: View {
    
// MARK: - Presenter
    @ObservedObject var presenter = FilmsListPresenter()
    
// MARK: - Body
    var body: some View {
        List {
            FilmsListGenresView(genres: self.presenter.data.genres) { self.presenter.onClickGenre($0) }
            
            ForEach(self.getSectionsFromData(self.presenter.data.filmsModels)) { section in
                Section(header: YearHeaderView(yearString: section.header?.title ?? "")) {
                    ForEach(section.elements.compactMap { $0 as? FilmModel }) { filmModel in
                        ZStack {
                            FilmCellView(filmModel: filmModel).onTapGesture {
                                self.presenter.onClickFilmWithId(filmModel.id)
                            }
                        }
                    }
                }
            }
        }
            
        .navigationBarTitle(Text("films"))
        .onAppear {
            self.presenter.viewOnAppear()
        }
    }
    
}

// MARK: - IFilmsListView
extension FilmsListView: Presentable {

    var iPresenter: IPresenter? { self.presenter }
}

// MARK: - getSectionsFrom
extension FilmsListView {
    
#warning("Подумать как унифицировать метод")
    private func getSectionsFromData(_ data: [FilmModel]) -> [SectionModel] {
        var secions = [SectionModel]()
        let yearsSet = Set<Int>(data.compactMap { $0.year }).sorted().reversed()
        for year in yearsSet {
            let stringYear = String(year)
            let sameYearsSection = SectionModel(id: stringYear)
            sameYearsSection.header = HeaderModel(id: stringYear, title: stringYear)
            sameYearsSection.elements = data.filter { $0.year == year }

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
