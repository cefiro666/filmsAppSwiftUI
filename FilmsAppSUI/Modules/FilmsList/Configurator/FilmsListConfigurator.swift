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
    func createScreen<Content: View&Presentable>(withView view: Content,
                                                 configureBlock: ((Content?) -> ())?) -> UIViewController {
        self.view = view as? FilmsListView<FilmsListPresenterImpl>
        let router = FilmsListRouterImpl()

        self.view.presenter.setUseCase(GetFilmsUseCaseImpl())
        
        self.view.presenter.router = router
        self.view.presenter.view = self.view
        
        configureBlock?(self.view as? Content)
        
        return UIHostingController<ContainerView<FilmsListView>>(rootView: ContainerView(content: self.view))
    }
    
}
