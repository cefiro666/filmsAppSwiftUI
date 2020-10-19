//
//  SortingParameters.swift
//  filmsAppSwiftUI
//
//  Created by Виталий Баник on 16/10/2020.
//  Copyright © 2020 Sequenia. All rights reserved.
//

import Foundation

// MARK: - SortingParametersRouter
protocol SortingParametersRouter: Router {
    
    func closePopup()
}

// MARK: - SortingParametersRouterImpl
struct SortingParametersRouterImpl: SortingParametersRouter {
    
    func closePopup() {
        self.dismissScreen()
    }
}

