//
//  TabBarConfigurator.swift
//  FilmsAppSUI
//
//  Created by Виталий Баник on 12.10.2020.
//  Copyright © 2020 Виталий Баник. All rights reserved.
//

import UIKit

// MARK: - TabBarConfigurator
class TabBarConfigurator {
    
    static public func getTabBarFromTabBarItemType<Item: TabBarItem & CaseIterable>(
        _ tabType: Item.Type
    ) -> UITabBarController {
        
        let tabBarController = UITabBarController()
        var controllers = [UIViewController]()
        
        for tabItem in tabType.allCases {
            if let controller = tabItem.controller {
                controller.tabBarItem = UITabBarItem(title: tabItem.title,
                                                     image: tabItem.image,
                                                     selectedImage: tabItem.selectedImage)
                controllers.append(controller)
            }
        }
        
        tabBarController.setViewControllers(controllers, animated: false)
        
        return tabBarController
    }

}
