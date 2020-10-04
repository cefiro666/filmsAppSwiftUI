//
//  Tabs.swift
//  filmsAppSwiftUI
//
//  Created by Виталий Баник on 04/10/2020.
//  Copyright © 2020 Sequenia. All rights reserved.
//

import SwiftUI
import UIKit

// MARK: - TabsConfigurator
final class TabsConfigurator: Configurator {
       
// MARK: - Methods
    func createScreen<Content: View & Presentable>(withView view: Content,
                                                   configureBlock: ((Content?) -> ())?) -> UIViewController {
        
        guard let view = view as? TabsView<TabsPresenterImpl> else { return UIViewController() }
        let router = TabsRouterImpl()

        view.presenter.router = router
        view.presenter.view = view
        
        configureBlock?(view as? Content)
        
        return UIHostingController<ContainerView<TabsView>>(rootView: ContainerView(content: view))
    }
    
}
