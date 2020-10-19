//
//  FilmsTableView.swift
//  FilmsAppSUI
//
//  Created by Виталий Баник on 23.09.2020.
//  Copyright © 2020 Виталий Баник. All rights reserved.
//

import SwiftUI

// MARK: - FilmsTableView
struct FilmsTableView: View {
    
// MARK: - Properties
    var sections: [SectionModel]
    var clickHandler: ((String) -> ())?
    
// MARK: - Body
    var body: some View {
        ZStack {
            if #available(iOS 14.0, *) {
                ScrollView {
                    LazyVStack(pinnedViews:[.sectionHeaders]) {
                        self.sectionsList
                    }
                    
                    Spacer(minLength: 14.0)
                        .background(Color.clear)
                }
            } else {
                List {
                    self.sectionsList
                }
            }
        }
    }
    
// MARK: - Sections list
    private var sectionsList: some View {
        ForEach(self.sections) { section in
            Section(header: YearHeaderView(yearString: section.header?.title ?? "")) {
                ForEach(section.elements.compactMap { $0 as? FilmModel }) { filmModel in
                    FilmCellView(filmModel: filmModel)
                        .onTapGesture {
                            self.clickHandler?(filmModel.id)
                    }
                }
            }
        }
    }    
}

// MARK: - PreviewProvider
struct FilmsTableView_Previews: PreviewProvider {
    
    static var previews: some View {
        FilmsTableView(sections: [])
    }
}
