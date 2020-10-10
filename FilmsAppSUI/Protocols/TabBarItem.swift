//
//  TabBarItem.swift
//  FilmsAppSUI
//
//  Created by Виталий Баник on 10.10.2020.
//  Copyright © 2020 Виталий Баник. All rights reserved.
//

import SwiftUI
import UIKit

// MARK: - TabBarItem
protocol TabBarItem: CaseIterable {
    
    var title: String { get }
    var image: UIImage? { get }
    var selectedImage: UIImage? { get }
    var controller: UIViewController? { get }
    var tabIndex: Int { get }
}
