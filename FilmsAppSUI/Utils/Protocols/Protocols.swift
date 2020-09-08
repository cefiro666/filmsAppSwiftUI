//
//  Protocols.swift
//  FilmsAppSUI
//
//  Created by Виталий Баник on 08.09.2020.
//  Copyright © 2020 Виталий Баник. All rights reserved.
//

import UIKit

// MARK: - IViewModel
protocol IViewModel: class {
    
    var listener: IContainer? { get set }
    
    func update(data: Any?)
}

// MARK: - Modellable
protocol Modellable {
    
    var viewModel: IViewModel? { get }
    
    func showErrorMessage(_ message: String?)
    
    func setLoadingVisible(_ visible: Bool)
}

extension Modellable {
    
    func showErrorMessage(_ message: String?) {
        self.viewModel?.listener?.showErrorMessage(message)
    }
    
    func setLoadingVisible(_ visible: Bool) {
        self.viewModel?.listener?.setLoadingVisible(visible)
    }

}

// MARK: - IConfigurator
protocol IConfigurator: class {
    
    func createScreen(_ data: Any?) -> UIViewController
}

// MARK: - IPresenter
protocol IPresenter: class {
    
    func showErrorMessage(_ message: String?)
    func setLoadingVisible(_ state: Bool)
}

// MARK: - IInputView
protocol IInputView {
    
    func updateModel(data: Any?)
}
