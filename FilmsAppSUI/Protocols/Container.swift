//
//  Container.swift
//  FilmsAppSUI
//
//  Created by Виталий Баник on 13.10.2020.
//  Copyright © 2020 Виталий Баник. All rights reserved.
//

import Foundation

// MARK: - Container
protocol Container: class {
    
    func showErrorMessage(_ message: String?, _ completionHandler: (() -> ())?)
    func setLoadingVisible(_ visible: Bool)
}
