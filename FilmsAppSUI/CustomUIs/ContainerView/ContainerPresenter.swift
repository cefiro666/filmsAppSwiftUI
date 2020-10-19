//
//  ContainerPresenter.swift
//  FilmsAppSUI
//
//  Created by Виталий Баник on 08.09.2020.
//  Copyright © 2020 Виталий Баник. All rights reserved.
//

import SwiftUI

// MARK: - Constants
fileprivate struct Constants {
    
    static let kDefaultErrorText = "Неизвестная ошибка"
}

// MARK: - ContainerModel
final class ContainerPresenter: ObservableObject {
    
// MARK: - Properties
    @Published var isLoading = false
    @Published var hasError = false
    @Published var errorMessage = ""
    
    var errorClickHandler: (() -> ())?
}

// MARK: - Container
extension ContainerPresenter: Container {
    
    func showErrorMessage(_ message: String?, _ completionHandler: (() -> ())?) {
        self.hasError = true
        self.errorMessage = message ?? Constants.kDefaultErrorText
        self.errorClickHandler = completionHandler
    }
    
    func setLoadingVisible(_ visible: Bool) {
        self.isLoading = visible
    }
}
