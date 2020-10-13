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
struct TestPresentConfigurator: Configurator {
       
// MARK: - Methods
    static func createScreen<Content: View & Presentable>(withView view: Content,
                                                          configureBlock: ((Content?) -> ())?) -> UIViewController {
        
        guard let view = view as? TestPresentView else { fatalError("view does not comply with protocol") }

        view.presenter.router = TestPresentRouterImpl()
        
        configureBlock?(view as? Content)
        
        return UIHostingController<ContainerView<TestPresentView>>(rootView: ContainerView(content: view))
    }
    
}
