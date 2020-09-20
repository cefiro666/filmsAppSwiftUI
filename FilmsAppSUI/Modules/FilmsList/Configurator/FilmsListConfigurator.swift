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
final class FilmsListConfigurator: Configurator {
    
// MARK: - Methods
    var view: FilmsListView<FilmsListPresenterImpl>!
    
// MARK: - Methods
    func createScreen() -> UIViewController {
        self.view = FilmsListView(presenter: FilmsListPresenterImpl())
        let router = FilmsListRouterImpl()

        self.view.presenter.setUseCase(GetFilmsUseCaseImpl())
        
        self.view.presenter.router = router
        self.view.presenter.view = self.view
        
        return UIHostingController<ContainerView<FilmsListView>>(rootView: ContainerView(content: self.view))
    }
    
}
