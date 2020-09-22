//
//  Protocols.swift
//  FilmsAppSUI
//
//  Created by Виталий Баник on 08.09.2020.
//  Copyright © 2020 Виталий Баник. All rights reserved.
//

import SwiftUI
import UIKit

// MARK: - Presenter
protocol Presenter: ObservableObject {
    
    var container: Container? { get set }
    
    func onClickError()
}

extension Presenter {
    
    func onClickError() {}
}

// MARK: - Presentable
protocol Presentable {
    associatedtype PresenterType: Presenter
    
    var presenter: PresenterType { get }
    
    func showErrorMessage(_ message: String?)
    func setLoadingVisible(_ visible: Bool)
}

extension Presentable {
    
    func showErrorMessage(_ message: String?) {
        self.presenter.container?.showErrorMessage(message)
    }
    
    func setLoadingVisible(_ visible: Bool) {
        self.presenter.container?.setLoadingVisible(visible)
    }
}

// MARK: - Configurator
protocol Configurator: class {
    
    func createScreen<Content: View&Presentable>(withView view: Content,
                                                 configureBlock: ((Content?) -> ())?) -> UIViewController
}

// MARK: - Configurable
protocol Configurable {
    
    var configurator: Configurator { get set }
}
