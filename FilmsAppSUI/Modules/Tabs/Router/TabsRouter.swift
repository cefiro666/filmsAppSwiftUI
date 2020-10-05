//
//  Tabs.swift
//  filmsAppSwiftUI
//
//  Created by Виталий Баник on 04/10/2020.
//  Copyright © 2020 Sequenia. All rights reserved.
//

import UIKit

// MARK: - Tabs
enum TabBarItem: Int {
    
    case films
    case someTab
}

// MARK: - TabsRouter
protocol TabsRouter: Router {
 
    func configureTabs()
}

// MARK: - TabsRouterImpl
struct TabsRouterImpl: TabsRouter {
    
    func configureTabs() {
        let tabBarController = UITabBarController()
        SceneDelegate.setupRoot(viewController: tabBarController)
        
        guard let filmsController = Navigator.shared.getScreenWithNavBar(view: FilmsListView(presenter: FilmsListPresenterImpl()),
                                                                         configureBlock: nil) else { return }
        
        filmsController.tabBarItem = UITabBarItem(title: "Фильмы",
                                                  image: UIImage(systemName: "list.dash"),
                                                  selectedImage: UIImage(systemName: "list.dash"))
        
        guard let someController = Navigator.shared.getScreenWithNavBar(view: FilmsListView(presenter: FilmsListPresenterImpl()),
                                                                        configureBlock: nil) else { return }
        
        someController.tabBarItem = UITabBarItem(title: "Some tab",
                                                 image: UIImage(systemName: "square.and.pencil"),
                                                 selectedImage: UIImage(systemName: "square.and.pencil"))
        
        guard let testController = Navigator.shared.getScreen(view: TestView(presenter: TestPresenterImpl()),
                                                              configureBlock: nil) else { return }
        
        testController.tabBarItem = UITabBarItem(title: "Test tab",
                                                 image: UIImage(systemName: "square.and.pencil"),
                                                 selectedImage: UIImage(systemName: "square.and.pencil"))
        
        Navigator.shared.tabBarController?.setViewControllers([
            filmsController,
            someController,
            testController,
        ], animated: false)
    }
    
}
