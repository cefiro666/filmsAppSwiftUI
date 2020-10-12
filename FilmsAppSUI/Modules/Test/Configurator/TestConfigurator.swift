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
final class TestConfigurator: Configurator {
       
// MARK: - Methods
    static func createScreen<Content: View & Presentable>(withView view: Content,
                                                          configureBlock: ((Content?) -> ())?) -> UIViewController {
        
        guard let view = view as? TestView else { return UIViewController() }
        let router = TestRouterImpl()

        view.presenter.router = router
        
        configureBlock?(view as? Content)
        
        return UIHostingController<ContainerView<TestView>>(rootView: ContainerView(content: view))
    }
    
}
