//
//  ContainerPresenter.swift
//  FilmsAppSUI
//
//  Created by Виталий Баник on 08.09.2020.
//  Copyright © 2020 Виталий Баник. All rights reserved.
//

import SwiftUI

// MARK: - ContainerModel
final class ContainerPresenter: ObservableObject {
    
// MARK: - Properties
    @Published var isLoading = false
    @Published var hasError = false
    @Published var errorMessage = ""
}

// MARK: - Container
extension ContainerPresenter: Container {
    
    func showErrorMessage(_ message: String?) {
        self.hasError = true
        self.errorMessage = message ?? "Неизвестная ошибка"
    }
    
    func setLoadingVisible(_ visible: Bool) {
        self.isLoading = visible
    }
}
