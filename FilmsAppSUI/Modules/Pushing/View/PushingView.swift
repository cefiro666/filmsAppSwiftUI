//
//  Pushing.swift
//  filmsAppSwiftUI
//
//  Created by Виталий Баник on 15/10/2020.
//  Copyright © 2020 Sequenia. All rights reserved.
//

import SwiftUI

// MARK: - PushingView
struct PushingView: Contentable {

// MARK: - Properties
    @ObservedObject var presenter = PushingPresenterImpl()
    let configurator: Configurator.Type = PushingConfigurator.self

// MARK: - Body
    var body: some View {
        Text("Tap to pop or tap system back arrow!")
            .foregroundColor(Color(UIColor.systemBlue))
            .onTapGesture {
                self.presenter.onClickPop()
        }
    }
}

// MARK: - PreviewProvider
struct Pushing_Previews: PreviewProvider {
    
    static var previews: some View {
        PushingView()
    }
}
