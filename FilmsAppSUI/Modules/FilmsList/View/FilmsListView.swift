//
//  FilmsListView.swift
//  FilmsAppSUI
//
//  Created by Виталий Баник on 28.08.2020.
//  Copyright © 2020 Виталий Баник. All rights reserved.
//

import SwiftUI

// MARK: - IFilmsListView
protocol IFilmsListView: Presentable {
    
}

// MARK: - FilmsListView
struct FilmsListView: View {
    
// MARK: - Properties
    @ObservedObject var presenter = FilmsListPresenter()
    
// MARK: - Body
    var body: some View {
        List {
            self.genres
            ForEach(self.getSectionsFromData(self.presenter.data.films)) { section in
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
        }.navigationBarTitle(Text("films"))
        
        .onAppear {
            UITableViewHeaderFooterView.appearance().tintColor = UIColor.clear
            UITableView.appearance().separatorStyle = .none
            UITableView.appearance().allowsSelection = false
            UITableViewCell.appearance().selectionStyle = .none
            
            self.presenter.viewOnAppear()
        }
        
        .onDisappear {
            UITableView.appearance().separatorStyle = .singleLine
            UITableView.appearance().allowsSelection = true
            UITableViewCell.appearance().selectionStyle = .default
        }
    }
    
// MARK: - genres
    private var genres: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                ForEach(self.presenter.data.genres, id: \.hashValue) { genre in
                    Button(action: {
                        self.presenter.onClickGenre(genre)
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

// MARK: - IFilmsListView
extension FilmsListView: IFilmsListView {

    var iPresenter: IPresenter? { self.presenter }
}

// MARK: - getSectionsFrom
extension FilmsListView {
    
    private func getSectionsFromData(_ data: [Film]) -> [SectionModel] {
        var secions = [SectionModel]()
        let yearsSet = Set<Int>(data.compactMap { $0.year }).sorted().reversed()
        for year in yearsSet {
            let stringYear = String(year)
            let sameYearsSection = SectionModel(id: stringYear)
            sameYearsSection.header = HeaderModel(id: stringYear, title: stringYear)
            sameYearsSection.elements = data
                .filter { $0.year == year }
                .map { film in

                    FilmModel(id: String(film.id),
                              localizedName: film.localizedName,
                              year: film.year,
                              name: film.name,
                              rating: film.rating,
                              imageURL: film.imageURL,
                              filmDescription: film.filmDescription,
                              genres: film.genres)
            }

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
