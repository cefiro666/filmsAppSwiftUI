//
//  ErrorView.swift
//  FilmsAppSUI
//
//  Created by Виталий Баник on 15.10.2020.
//  Copyright © 2020 Виталий Баник. All rights reserved.
//

import SwiftUI

// MARK: - ErrorView
struct ErrorView: View {
    
// MARK: - Properties
    var message: String
    var clickHandler: (() -> ())?
    
// MARK: - Body
    var body: some View {
        HStack() {
            Text(self.message)
                .foregroundColor(.white)
                .lineLimit(2)

            Spacer()
            
            Image(systemName: "repeat")
                .foregroundColor(Color(UIColor.systemBlue))
        }
 
        .frame(width: UIScreen.main.bounds.width * 0.8)
        .eraseToAnyView()
        .padding()
        .background(Color(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.7981592466)))
        .cornerRadius(15.0)
        .onTapGesture {
            self.clickHandler?()
        }
    }
}

// MARK: - PreviewProvider
struct ErrorView_Previews: PreviewProvider {
    static var previews: some View {
        ErrorView(message: "Error message!")
    }
}
