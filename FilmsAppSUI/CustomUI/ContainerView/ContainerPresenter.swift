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
    
// MARK: - Methods
    func showErrorMessage(_ message: String?) {
        self.hasError = true
        self.errorMessage = message ?? "Неизвестная ошибка"
    }
    
    func setLoadinVisible(_ visible: Bool) {
        self.isLoading = visible
    }
}
