//
//  Test.swift
//  filmsAppSwiftUI
//
//  Created by Виталий Баник on 05/10/2020.
//  Copyright © 2020 Sequenia. All rights reserved.
//

import SwiftUI
import UIKit

// MARK: - TestConfigurator
struct TestConfigurator: Configurator {
       
// MARK: - Methods
    static func createScreen<Content: Contentable>(withView view: Content,
                                                   configureBlock: ((Content?) -> ())?) -> UIViewController {
        
        guard let view = view as? TestView else { fatalError("view does not comply with protocol") }

        view.presenter.router = TestRouterImpl()
        
        configureBlock?(view as? Content)
        
        return UIHostingController<ContainerView<TestView>>(rootView: ContainerView(content: view))
    }
    
}
