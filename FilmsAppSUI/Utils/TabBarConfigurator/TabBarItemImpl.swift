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
    case testTab
}

// MARK: - TabBarItem
extension TabBarItemImpl: TabBarItem {
    
    var tabIndex: Int {
        return self.rawValue
    }
    
    var title: String {
        switch self {
        case .films: return "Фильмы"
        case .testTab: return "TestTab"
        }
    }
    
    var image: UIImage? {
        switch self {
        case .films: return UIImage(systemName: "list.dash")
        case .testTab: return UIImage(systemName: "square.and.pencil")
        }
    }
    
    var selectedImage: UIImage? {
        switch self {
        case .films: return UIImage(systemName: "list.dash")
        case .testTab: return UIImage(systemName: "square.and.pencil")
        }
    }
    
    var controller: UIViewController? {
        switch self {
        case .films:
            let viewController = FilmsListConfigurator.createScreen(withView: FilmsListView(),
                                                                    configureBlock: nil)
            viewController.title = "Фильмы"
            let navigationController = UINavigationController(rootViewController: viewController)
            return navigationController
            
        case .testTab:
            let viewController = FilmsListConfigurator.createScreen(withView: FilmsListView(),
                                                                    configureBlock: nil)
            viewController.title = "Фильмы"
            let navigationController = UINavigationController(rootViewController: viewController)
            return navigationController
//            let viewController = TestConfigurator.createScreen(withView: TestView(),
//                                                               configureBlock: nil)
//            return viewController
        }
    }
    
}
