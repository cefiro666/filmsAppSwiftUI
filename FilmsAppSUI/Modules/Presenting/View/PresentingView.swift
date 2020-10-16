//
//  Presenting.swift
//  filmsAppSwiftUI
//
//  Created by Виталий Баник on 15/10/2020.
//  Copyright © 2020 Sequenia. All rights reserved.
//

import SwiftUI

// MARK: - PresentingView
struct PresentingView: Contentable {

// MARK: - Properties
    @ObservedObject var presenter = PresentingPresenterImpl()
    static let configurator = PresentingConfigurator.self

// MARK: - Body
    var body: some View {
        Text("Tap to dismiss!")
            .foregroundColor(Color(UIColor.systemBlue))
            .onTapGesture {
                self.presenter.onClickDismiss()
        }
    }
}

// MARK: - PreviewProvider
struct Presenting_Previews: PreviewProvider {
    
    static var previews: some View {
        PresentingView()
    }
}
