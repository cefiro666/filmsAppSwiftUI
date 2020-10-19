//
//  SortingParameters.swift
//  filmsAppSwiftUI
//
//  Created by Виталий Баник on 16/10/2020.
//  Copyright © 2020 Sequenia. All rights reserved.
//

import SwiftUI

// MARK: - SortingParameters
enum SortingParameter: Int, CaseIterable {
    
    case oldFirst
    case newFirst
    
// MARK: - title
    var title: String {
        switch self {
            case .oldFirst: return "Сначала старые"
            case .newFirst: return "Сначала новые"
        }
    }
}

// MARK: - SortingParametersView
struct SortingParametersView: Contentable {

// MARK: - Vuper
    @ObservedObject var presenter = SortingParametersPresenterImpl()
    static let configurator = SortingParametersConfigurator.self

// MARK: - Body
    var body: some View {
        VStack(spacing: 20.0) {
            HStack {
                Spacer()
                
                Button("Готово") {
                    self.presenter.onClickDone()
                }
            }
            
            .padding(.trailing, 20.0)
            .padding(.vertical, 8.0)
            .eraseToAnyView()
            .background(Color(.systemGray4))
            
            Picker(selection: Binding(
                        get: { self.presenter.data.selectedParameter.rawValue },
                        set: { self.presenter.onSelectSortingParameter(SortingParameter(rawValue: $0) ?? .newFirst) }),
                   label: EmptyView()) {
                        ForEach(0..<SortingParameter.allCases.count) {
                            Text(SortingParameter.allCases[$0].title)
                        }
                    }
            
            .pickerStyle(SegmentedPickerStyle())
            .padding()
            
            Spacer()
        }
        
        .onDisappear {
            self.presenter.viewOnDisappear()
        }
    }
}

// MARK: - PreviewProvider
struct SortingParameters_Previews: PreviewProvider {
    
    static var previews: some View {
        SortingParametersView()
    }
}
