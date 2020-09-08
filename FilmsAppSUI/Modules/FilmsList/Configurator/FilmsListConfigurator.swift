//
//  FilmsListConfigurator.swift
//  FilmsAppSUI
//
//  Created by Виталий Баник on 07.09.2020.
//  Copyright © 2020 Виталий Баник. All rights reserved.
//

import SwiftUI
import UIKit

// MARK: - FilmsListConfigurator
final class FilmsListConfigurator: IConfigurator {
    
// MARK: - shared
    static let shared = FilmsListConfigurator()
    private init() {}
    
// MARK: - Methods
    func createScreen(_ data: Any?) -> UIViewController {
        var view = FilmsListView()
        let presenter = FilmsListPresenter()
        let interactor = FilmsListInteractor()
            .setUseCase(GetFilmsUseCaseImpl())
        
        interactor.output = presenter
        presenter.output = view
        view.output = interactor
        
        return UIHostingController<ContainerView<FilmsListView>>(rootView: ContainerView(content: view))
    }
    
}
