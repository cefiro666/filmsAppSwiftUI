//
//  Router.swift
//  FilmsAppSUI
//
//  Created by Виталий Баник on 10.10.2020.
//  Copyright © 2020 Виталий Баник. All rights reserved.
//

import Foundation

// MARK: - Router
protocol Router {
    
    func popScreen()
    func dismissScreen(completion: (() -> ())?)
}

extension Router {

    func popScreen() {
        Utils.navigator.popScreen()
    }
    
    func dismissScreen(completion: (() -> ())?) {
        Utils.navigator.dismissScreen(completion: completion)
    }
    
}
