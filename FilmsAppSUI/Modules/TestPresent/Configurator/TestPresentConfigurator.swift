//
//  TestPresent.swift
//  filmsAppSwiftUI
//
//  Created by Виталий Баник on 06/10/2020.
//  Copyright © 2020 Sequenia. All rights reserved.
//

import SwiftUI
import UIKit

// MARK: - TestPresentConfigurator
final class TestPresentConfigurator: Configurator {
       
// MARK: - Methods
    static func createScreen<Content: View & Presentable>(withView view: Content,
                                                          configureBlock: ((Content?) -> ())?) -> UIViewController {
        
        guard let view = view as? TestPresentView<TestPresentPresenterImpl> else { return UIViewController() }
        let router = TestPresentRouterImpl()

        view.presenter.router = router
        view.presenter.view = view
        
        configureBlock?(view as? Content)
        
        return UIHostingController<ContainerView<TestPresentView>>(rootView: ContainerView(content: view))
    }
    
}
