//
//  Tabs.swift
//  filmsAppSwiftUI
//
//  Created by Виталий Баник on 04/10/2020.
//  Copyright © 2020 Sequenia. All rights reserved.
//

import SwiftUI

// MARK: - TabsView
struct TabsView<Presenter>: View, Presentable, Configurable where Presenter: TabsPresenter {
    
// MARK: - Presenter
    @ObservedObject var presenter: Presenter
    var configurator: Configurator = TabsConfigurator()

// MARK: -  body
    var body: some View {
        ZStack {}
            .onAppear() {
                self.presenter.viewOnAppear()
                Navigator.shared.tabBarController?.tabBar.tintColor = UIColor.black
                Navigator.shared.tabBarController?.tabBar.unselectedItemTintColor = UIColor.gray
            }
    }
}

// MARK: - PreviewProvider
struct Tabs_Previews: PreviewProvider {
    
    static var previews: some View {
        TabsView(presenter: TabsPresenterImpl())
    }
}
