//
//  ErrorView.swift
//  FilmsAppSUI
//
//  Created by Виталий Баник on 07.09.2020.
//  Copyright © 2020 Виталий Баник. All rights reserved.
//

import SwiftUI

// MARK: - ErrorView
struct ErrorView: View {
    
// MARK: - Properties
    var error: Error?
    var completion: (() -> ())?
   
// MARK: - body
    var body: some View {
        VStack {
            Text(error?.localizedDescription ?? "")
            
            Button(action: {
                self.completion?()
            }) {
                Text("Повторить")
                
            }
            .frame(width: 100.0, height: 40.0, alignment: .center)
            .background(Color(#colorLiteral(red: 0.7475681534, green: 0.4965922286, blue: 0.7647058964, alpha: 1)))
            .foregroundColor(Color(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)))
            .cornerRadius(10)
            .padding()
        }
    }
}

// MARK: - PreviewProvider
struct ErrorView_Previews: PreviewProvider {
    
    static var previews: some View {
        ErrorView()
    }
}
