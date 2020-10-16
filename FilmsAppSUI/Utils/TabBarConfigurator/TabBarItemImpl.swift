//
//  TabBarItemImpl.swift
//  FilmsAppSUI
//
//  Created by Виталий Баник on 10.10.2020.
//  Copyright © 2020 Виталий Баник. All rights reserved.
//

import SwiftUI
import UIKit

// MARK: - Tab
enum TabBarItemImpl: Int {
    
    case films
    case testing
}

// MARK: - TabBarItem
extension TabBarItemImpl: TabBarItem {
    
    var tabIndex: Int {
        return self.rawValue
    }
    
    var title: String {
        switch self {
        case .films: return "Фильмы"
        case .testing: return "Testing"
        }
    }
    
    var image: UIImage? {
        switch self {
        case .films: return UIImage(systemName: "list.dash")
        case .testing: return UIImage(systemName: "square.and.pencil")
        }
    }
    
    var selectedImage: UIImage? {
        switch self {
        case .films: return UIImage(systemName: "list.dash")
        case .testing: return UIImage(systemName: "square.and.pencil")
        }
    }
    
    var controller: UIViewController? {
        switch self {
        case .films:
            let viewController = FilmsListConfigurator.createScreen(configureBlock: nil)
            viewController.title = "Фильмы"
            let navigationController = UINavigationController(rootViewController: viewController)
            return navigationController
            
        case .testing:
            let viewController = TestingTabConfigurator.createScreen(configureBlock: nil)
            viewController.title = "Testing"
            let navigationController = UINavigationController(rootViewController: viewController)
            return navigationController
        }
    }
    
}
