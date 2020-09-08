//
//  FilmsListView.swift
//  FilmsAppSUI
//
//  Created by Виталий Баник on 28.08.2020.
//  Copyright © 2020 Виталий Баник. All rights reserved.
//

import SwiftUI

// MARK: - IFilmsListView
protocol IFilmsListView: IInputView, Modellable {
    
    var output: IFilmsListInteractor? { get set }
}

// MARK: - FilmsListView
struct FilmsListView: View {
    
// MARK: - Properties
    var output: IFilmsListInteractor?
    var container: IContainer?
    
// MARK: - Model
    @ObservedObject var model = FilmsListViewModel()
    
// MARK: - Body
    var body: some View {
        List {
            self.genres
            
            ForEach(self.model.sections) { section in
                Section(header: YearHeaderView(yearString: section.header?.title)) {
                    ForEach(section.elements.compactMap { $0 as? FilmModel }) { filmModel in
                        ZStack {
                            FilmCellView(filmModel: filmModel).onTapGesture {
                                Navigator.shared.push(screen: FilmDetailsView.self,
                                                      data: self.output?.getFilmWithId(filmModel.id))
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
            
            self.output?.getFilms()
        }

        .onDisappear {
            UITableView.appearance().separatorStyle = .singleLine
            UITableView.appearance().allowsSelection = true
            UITableViewCell.appearance().selectionStyle = .default
        }    }
    
// MARK: - genres
    private var genres: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                ForEach(self.model.genres, id: \.hashValue) { genre in
                    Button(action: {
                        self.output?.onClickGenre(genre)
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
    
    var viewModel: IViewModel? { self.model }
    
    func updateModel(data: Any?) {
        self.model.update(data: data)
    }
}

// MARK: - PreviewProvider
struct FilmsListView_Previews: PreviewProvider {

    static var previews: some View {
        FilmsListView()
    }
}
