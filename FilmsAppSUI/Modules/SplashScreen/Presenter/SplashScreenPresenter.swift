//
//  SplashScreen.swift
//  filmsAppSwiftUI
//
//  Created by Виталий Баник on 15/10/2020.
//  Copyright © 2020 Sequenia. All rights reserved.
//

import Foundation

// MARK: - SplashScreenPresenter
protocol SplashScreenPresenter: Presenter {

    var router: SplashScreenRouter? { get set }
    var data: SplashScreenData { get }

    func viewOnAppear()
}

// MARK: - SplashScreenPresenterImpl
final class SplashScreenPresenterImpl: SplashScreenPresenter {
    
// MARK: - Properties
    var router: SplashScreenRouter?
    weak var container: Container?
    
// MARK: - Published data
    @Published var data = SplashScreenData()

// MARK: - Methods
    func viewOnAppear() {
        DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(3)) {
            self.router?.showMainScreen()
        }
    }
    
}
