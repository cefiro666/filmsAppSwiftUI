//
//  SortingButtonView.swift
//  FilmsAppSUI
//
//  Created by Виталий Баник on 16.10.2020.
//  Copyright © 2020 Виталий Баник. All rights reserved.
//

import SwiftUI

// MARK: - SortButtonView
struct SortingButtonView: View {
    
// MARK: - Properties
    var clickHandler: (() -> ())?
    
// MARK: - Body
    var body: some View {
        Image(systemName: "line.horizontal.3.decrease")
            .foregroundColor(Color(UIColor.systemBlue))
            .onTapGesture {
                self.clickHandler?()
            }
    }
}

// MARK: - PreviewProvider
struct SortingButtonView_Previews: PreviewProvider {
    
    static var previews: some View {
        SortingButtonView()
    }
}
