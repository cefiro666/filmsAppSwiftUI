//
//  MockSceneDelegate.swift
//  FilmsAppSUITests
//
//  Created by Виталий Баник on 06.10.2020.
//  Copyright © 2020 Виталий Баник. All rights reserved.
//

import SwiftUI

// MARK: - MockSceneDelegate
class MockSceneDelegate: NSObject, UIWindowSceneDelegate {
    
// MARK: - Properties
    var window: UIWindow?
     
// MARK: - Inits
    override init() {
        self.window = UIWindow()
    }
    
}
