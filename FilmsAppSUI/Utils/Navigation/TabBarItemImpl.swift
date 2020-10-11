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
    case someTab
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
        case .someTab: return "someTab"
        case .testTab: return "testTab"
        }
    }
    
    var image: UIImage? {
        switch self {
        case .films: return UIImage(systemName: "list.dash")
        case .someTab: return UIImage(systemName: "square.and.pencil")
        case .testTab: return UIImage(systemName: "square.and.pencil")
        }
    }
    
    var selectedImage: UIImage? {
        switch self {
        case .films: return UIImage(systemName: "list.dash")
        case .someTab: return UIImage(systemName: "square.and.pencil")
        case .testTab: return UIImage(systemName: "square.and.pencil")
        }
    }
    
    var controller: UIViewController? {
        switch self {
        case .films:
            return Utils.navigator.getScreenWithNavBar(view: FilmsListView(presenter: FilmsListPresenterImpl()),
                                                       title: "Фильмы",
                                                       configureBlock: nil)
            
        case .someTab:
            return Utils.navigator.getScreenWithNavBar(view: FilmsListView(presenter: FilmsListPresenterImpl()),
                                                       title: "Фильмы",
                                                       configureBlock: nil)
            
            
        case .testTab:
            return Utils.navigator.getScreen(view: TestView(presenter: TestPresenterImpl()),
                                             configureBlock: nil)
        }
    }
}
