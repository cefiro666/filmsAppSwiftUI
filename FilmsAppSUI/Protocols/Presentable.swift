//
//  Presentable.swift
//  FilmsAppSUI
//
//  Created by Виталий Баник on 10.10.2020.
//  Copyright © 2020 Виталий Баник. All rights reserved.
//

import Foundation

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
