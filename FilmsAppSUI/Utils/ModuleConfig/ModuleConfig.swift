//
//  ModuleConfig.swift
//  FilmsAppSUI
//
//  Created by Виталий Баник on 28.08.2020.
//  Copyright © 2020 Виталий Баник. All rights reserved.
//

import UIKit
import SwiftUI

// MARK: - ModuleConfig
class ModuleConfig {

// MARK: - shared
    static let shared = ModuleConfig()
    private init() {}
    
// MARK: - Methods
    func config<Content: View>(screen: Content.Type) -> IConfigurator? {
        switch screen {
        case is FilmsListView.Type:
            return FilmsListConfigurator.shared

        case is FilmDetailsView.Type:
            return FilmDetailsConfigurator.shared

        default:
            return nil
        }
    }
    
}
