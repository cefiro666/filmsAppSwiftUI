//
//  ContainerModel.swift
//  FilmsAppSUI
//
//  Created by Виталий Баник on 08.09.2020.
//  Copyright © 2020 Виталий Баник. All rights reserved.
//

import SwiftUI

// MARK: - ContainerModel
class ContainerModel: ObservableObject {
    
// MARK: - Properties
    @Published var isLoading: Bool = false
    @Published var hasError: Bool = false
    @Published var errorMessage: String = ""
    
// MARK: - Methods
    func showErrorMessage(_ message: String?) {
        self.hasError = true
        self.errorMessage = message ?? "Неизвестная ошибка"
    }
    
    func setLoadinVisible(_ visible: Bool) {
        self.isLoading = visible
    }
}
