//
//  SplashScreen.swift
//  filmsAppSwiftUI
//
//  Created by Виталий Баник on 15/10/2020.
//  Copyright © 2020 Sequenia. All rights reserved.
//

import SwiftUI

// MARK: - SplashScreenView
struct SplashScreenView: Contentable {

// MARK: - Vuper
    @ObservedObject var presenter = SplashScreenPresenterImpl()
    static let configurator = SplashScreenConfigurator.self

// MARK: - Body
    var body: some View {
        LottieView(name: "loading", loopMode: .loop)
            .frame(width: 300, height: 300)
            .onAppear {
                self.presenter.viewOnAppear()
        }
    }
}

// MARK: - PreviewProvider
struct SplashScreen_Previews: PreviewProvider {
    
    static var previews: some View {
        SplashScreenView()
    }
}
