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
struct FilmsListConfigurator: Configurator {
    
// MARK: - Methods
    static func createScreen<Content: View & Presentable>(withView view: Content,
                                                          configureBlock: ((Content?) -> ())?) -> UIViewController {
        
        guard let view = view as? FilmsListView else { fatalError("view does not comply with protocol") }
        
        view.presenter.router = FilmsListRouterImpl()

        view.presenter.setUseCase(GetFilmsUseCaseImpl())
        
        configureBlock?(view as? Content)
        
        return UIHostingController<ContainerView<FilmsListView>>(rootView: ContainerView(content: view))
    }
    
}
