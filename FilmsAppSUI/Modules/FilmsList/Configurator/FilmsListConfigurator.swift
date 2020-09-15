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

// MARK: - Methods
    func createScreen(_ data: Any?) -> UIViewController {
        var view = FilmsListView()
        let router = FilmsListRouter()

        view.presenter = view.presenter
            .setUseCase(GetFilmsUseCaseImpl())
        
        view.presenter.router = router
        view.presenter.view = view
        
        return UIHostingController<ContainerView<FilmsListView>>(rootView: ContainerView(content: view))
    }
    
}
