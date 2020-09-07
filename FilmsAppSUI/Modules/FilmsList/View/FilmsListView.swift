//
//  FilmsListView.swift
//  FilmsAppSUI
//
//  Created by Виталий Баник on 28.08.2020.
//  Copyright © 2020 Виталий Баник. All rights reserved.
//

import ImageViewerRemote
import SwiftUI

// MARK: - FilmsListView
struct FilmsListView: View {
    
// MARK: - View model
    @ObservedObject var viewModel = FilmsListViewModel()
    
// MARK: - Properties
    @State var needShowViewer: Bool = false
    @State var urlString: String = "https://i.pinimg.com/originals/2d/dc/25/2ddc25914e2ae0db5311ffa41781dda1.jpg"
    
// MARK: - body
    var body: some View {
        
        NavigationView {
            self.content
                .navigationBarTitle(Text("films"), displayMode: .large)
            
        }.overlay(ImageViewerRemote(imageURL: self.$urlString, viewerShown: self.$needShowViewer))
            
        .onAppear {
            UITableViewHeaderFooterView.appearance().tintColor = UIColor.clear
            UITableView.appearance().separatorStyle = .none
            UITableView.appearance().allowsSelection = false
            UITableViewCell.appearance().selectionStyle = .none
            self.viewModel.onAppear()
        }
        
        .onDisappear {
            UITableView.appearance().separatorStyle = .singleLine
            UITableView.appearance().allowsSelection = true
            UITableViewCell.appearance().selectionStyle = .default
        }
    }
    
// MARK: - content
    private var content: some View {
        switch self.viewModel.state {
        case .loading:
            return SpinnerView(isAnimating: true, style: .large).eraseToAnyView()
            
        case .error(let error):
            return ErrorView(error: error) {
                self.viewModel.onAppear()
            }.eraseToAnyView()
            
        case .filmsLoaded(let sections):
            return VStack {
                self.genres
                self.getFilmsList(sections)
            }.eraseToAnyView()
        }
    }
    
// MARK: - Methods
    private func getFilmsList(_ sections: [SectionModel]) -> some View {
        List {
            ForEach(sections) { section in
                Section(header: YearHeaderView(yearString: section.header?.title)) {
                    ForEach(section.elements) { element in
                        ZStack {
                            FilmCellView(filmModel: element as! FilmModel)
                            NavigationLink(destination: FilmDetailsView(filmModel: element as! FilmModel,
                                                                        needShowViewer: self.$needShowViewer,
                                                                        urlString: self.$urlString)) {
                                EmptyView()
                            }
                        }
                    }
                }
            }
        }
    }
    
// MARK: - genres
    private var genres: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                Spacer(minLength: 15.0)
                ForEach(self.viewModel.genres, id: \.hashValue) { genre in
                    Button(action: {
                        self.viewModel.onClickGenre(genre)
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
                Spacer(minLength: 15.0)
            }
            
        }.padding(.vertical)
    }
    
}

// MARK: - PreviewProvider
struct FilmsListView_Previews: PreviewProvider {
    
    static var previews: some View {
        FilmsListView(viewModel: FilmsListViewModel())
    }
}
