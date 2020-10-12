//
//  Configurable.swift
//  FilmsAppSUI
//
//  Created by Виталий Баник on 10.10.2020.
//  Copyright © 2020 Виталий Баник. All rights reserved.
//

import Foundation

// MARK: - Configurable
protocol Configurable {
    
    var configurator: Configurator.Type { get }
}