//
//  TestModule.swift
//  filmsAppSwiftUI
//
//  Created by Виталий Баник on 06/10/2020.
//  Copyright © 2020 Sequenia. All rights reserved.
//

import Foundation

// MARK: - TestModulePresenter
protocol TestModulePresenter: Presenter {
    
    var router: TestModuleRouter? { get set }
    var data: TestModuleData { get }

    func viewOnAppear()
    func setTestString(_ string: String)
}

// MARK: - TestModulePresenterImpl
final class TestModulePresenterImpl: TestModulePresenter {
    
// MARK: - Properties
    var router: TestModuleRouter?
    weak var container: Container?
    
// MARK: - Published data
    @Published var data = TestModuleData()

// MARK: - Methods
    func viewOnAppear() {
        
    }
    
    func setTestString(_ string: String) {
        self.data.testString = string
    }
    
}
