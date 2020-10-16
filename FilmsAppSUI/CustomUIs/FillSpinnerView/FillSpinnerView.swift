//
//  FillSpinnerView.swift.swift
//  FilmsAppSUI
//
//  Created by Виталий Баник on 15.10.2020.
//  Copyright © 2020 Виталий Баник. All rights reserved.
//

import SwiftUI

// MARK: - FillSpinnerView
struct FillSpinnerView: View {
    
// MARK: - Body
    var body: some View {
        ZStack {
            Rectangle()
                .fill(Color(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.7981592466)))
                .frame(width: 100.0, height: 100.0)
                
                .cornerRadius(15.0)
                .eraseToAnyView()
                .accentColor(Color.white)
            
            SpinnerView(style: .large, color: .white)
        }
    }
}

// MARK: - PreviewProvider
struct FillSpinnerView_Previews: PreviewProvider {
    
    static var previews: some View {
        FillSpinnerView()
    }
}
