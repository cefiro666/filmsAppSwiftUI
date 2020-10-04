//
//  Tabs.swift
//  filmsAppSwiftUI
//
//  Created by Виталий Баник on 04/10/2020.
//  Copyright © 2020 Sequenia. All rights reserved.
//

import UIKit

// MARK: - TabsPresenter
protocol TabsPresenter: Presenter {
    
    associatedtype ViewType: Presentable
    
    var view: ViewType? { get set }
    var router: TabsRouter? { get set }
    var data: TabsData { get }
    
    func viewOnAppear()
}

// MARK: - TabsPresenterImpl
final class TabsPresenterImpl: TabsPresenter {
    
// MARK: - Properties
    var view: TabsView<TabsPresenterImpl>?
    var router: TabsRouter?

    var container: Container?
    
// MARK: - Published data
    @Published var data = TabsData()
    
// MARK: - Methods
    func viewOnAppear() {
        self.router?.configureTabs()
    }

}
