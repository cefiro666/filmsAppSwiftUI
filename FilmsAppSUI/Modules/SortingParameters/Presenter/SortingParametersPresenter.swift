//
//  SortingParameters.swift
//  filmsAppSwiftUI
//
//  Created by Виталий Баник on 16/10/2020.
//  Copyright © 2020 Sequenia. All rights reserved.
//

import Foundation

// MARK: - SortingParametersPresenter
protocol SortingParametersPresenter: Presenter {

    var router: SortingParametersRouter? { get set }
    var data: SortingParametersData { get }

    func setSelectParameter(_ parameter: SortingParameter)
    func setChangeSortingParameterCompletion(_ completion: ((SortingParameter) -> ())?)
    func viewOnDisappear()
    func onClickDone()
    func onSelectSortingParameter(_ parameter: SortingParameter)
}

// MARK: - SortingParametersPresenterImpl
final class SortingParametersPresenterImpl: SortingParametersPresenter {
    
// MARK: - Vuper
    var router: SortingParametersRouter?
    weak var container: Container?
    
// MARK: - Published data
    @Published var data = SortingParametersData()
    
// MARK: - Properties
    private var changeSortingParameterCompletion: ((SortingParameter) -> ())?

// MARK: - Methods
    func setSelectParameter(_ parameter: SortingParameter) {
        self.data.selectedParameter = parameter
    }
    
    func setChangeSortingParameterCompletion(_ completion: ((SortingParameter) -> ())?) {
        self.changeSortingParameterCompletion = completion
    }
    
    func viewOnDisappear() {
        self.changeSortingParameterCompletion?(self.data.selectedParameter)
    }
    
    func onClickDone() {
        self.changeSortingParameterCompletion?(self.data.selectedParameter)
        self.router?.closePopup()
    }
    
    func onSelectSortingParameter(_ parameter: SortingParameter) {
        self.data.selectedParameter = parameter
    }
    
}
