//
//  Protocols.swift
//  FilmsAppSUI
//
//  Created by Виталий Баник on 08.09.2020.
//  Copyright © 2020 Виталий Баник. All rights reserved.
//

import UIKit

// MARK: - IPresenter
protocol IPresenter: class {
    
    var listener: IContainer? { get set }
    
    func onClickError()
}

extension IPresenter {
    
    func onClickError() {}
}

// MARK: - Presentable
protocol Presentable {
    
    var iPresenter: IPresenter? { get }
    
    func showErrorMessage(_ message: String?)
    func setLoadingVisible(_ visible: Bool)
}

extension Presentable {
    
    func showErrorMessage(_ message: String?) {
        self.iPresenter?.listener?.showErrorMessage(message)
    }
    
    func setLoadingVisible(_ visible: Bool) {
        self.iPresenter?.listener?.setLoadingVisible(visible)
    }
}

// MARK: - IConfigurator
protocol IConfigurator: class {
    
    func createScreen(_ data: Any?) -> UIViewController
}
