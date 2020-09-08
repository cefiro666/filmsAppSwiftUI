//
//  YearHeaderView.swift
//  FilmsAppSUI
//
//  Created by Виталий Баник on 28.08.2020.
//  Copyright © 2020 Виталий Баник. All rights reserved.
//

import SwiftUI

// MARK: - YearHeaderView
struct YearHeaderView: View {

// MARK: - Properties
    var yearString: String?
    
// MARK: - body
    var body: some View {
        
        VStack {
            
            Text(self.yearString ?? "")
                .font(.title)
                .foregroundColor(.black)
                .multilineTextAlignment(.center)
                .padding()
                .frame(width: UIScreen.main.bounds.width - 28.0,
                       height: 40,
                       alignment: .center)
            
                .background(Color(#colorLiteral(red: 0.9411764741, green: 0.4980392158, blue: 0.3529411852, alpha: 1)))
                .cornerRadius(10)
                .shadow(radius: 5)
            
        }.padding(.vertical, 6)
    }
}

// MARK: - PreviewProvider
struct YearHeaderView_Previews: PreviewProvider {
    
    static var previews: some View {
        YearHeaderView(yearString: "1996")
    }
}
