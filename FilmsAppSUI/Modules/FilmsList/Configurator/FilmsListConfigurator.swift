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
    func createScreen<Content: View&Presentable>(withView view: Content,
                                                 configureBlock: ((Content?) -> ())?) -> UIViewController {
        
        guard let view = view as? FilmsListView<FilmsListPresenterImpl> else { return UIViewController() }
        let router = FilmsListRouterImpl()

        view.presenter.setUseCase(GetFilmsUseCaseImpl())
        
        view.presenter.router = router
        view.presenter.view = view
        
        configureBlock?(view as? Content)
        
        return UIHostingController<ContainerView<FilmsListView>>(rootView: ContainerView(content: view))
    }
    
}
