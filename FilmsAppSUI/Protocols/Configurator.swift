//
//  Configurator.swift
//  FilmsAppSUI
//
//  Created by Виталий Баник on 10.10.2020.
//  Copyright © 2020 Виталий Баник. All rights reserved.
//

import SwiftUI
import UIKit

// MARK: - Configurator
protocol Configurator {
    associatedtype Content: Contentable
    
    static func createScreen(configureBlock: ((Content?) -> ())?) -> UIViewController
}
