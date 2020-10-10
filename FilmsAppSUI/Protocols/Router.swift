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
    
    var Navigator: Navigator.Type { get }
    
    func popScreen()
    func dismissScreen(completion: (() -> ())?)
}

extension Router {
    
    var Navigator: Navigator.Type { return NavigatorImpl.self }
    
    func popScreen() {
        Navigator.popScreen()
    }
    
    func dismissScreen(completion: (() -> ())?) {
        Navigator.dismissScreen(completion: completion)
    }
    
}
