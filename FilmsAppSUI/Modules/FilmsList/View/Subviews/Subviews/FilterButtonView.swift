//
//  FilterButtonView.swift
//  FilmsAppSUI
//
//  Created by Виталий Баник on 25.09.2020.
//  Copyright © 2020 Виталий Баник. All rights reserved.
//

import SwiftUI

// MARK: - FilterButtonView
struct FilterButtonView: View {
    
// MARK: - Properties
    var clickHandler: (() -> ())?
    
// MARK: - body
    var body: some View {
        VStack {
            Spacer()
            
            Button(action: {
                self.clickHandler?()
            }) {
                Image(systemName: "line.horizontal.3.decrease")
                    .accentColor(Color.white)
                    .frame(width: 50.0, height: 50.0)
                    .background(Color.black)
                    .clipShape(Circle())
            }
            .padding(.bottom, 16.0)
        }
    }
}

// MARK: - PreviewProvider
struct FilterButtonView_Previews: PreviewProvider {
    
    static var previews: some View {
        FilterButtonView()
    }
}
