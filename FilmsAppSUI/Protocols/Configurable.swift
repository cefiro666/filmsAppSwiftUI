//
//  Configurable.swift
//  FilmsAppSUI
//
//  Created by Виталий Баник on 10.10.2020.
//  Copyright © 2020 Виталий Баник. All rights reserved.
//

// MARK: - Configurable
protocol Configurable {
    associatedtype ConfiguratorType: Configurator
    
    static var configurator: ConfiguratorType.Type { get }
}
