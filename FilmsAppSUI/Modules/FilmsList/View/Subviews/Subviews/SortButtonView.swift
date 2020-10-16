//
//  SortButtonView.swift
//  FilmsAppSUI
//
//  Created by Виталий Баник on 16.10.2020.
//  Copyright © 2020 Виталий Баник. All rights reserved.
//

import SwiftUI

// MARK: - SortButtonView
struct SortButtonView: View {
    
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
struct SortButtonView_Previews: PreviewProvider {
    
    static var previews: some View {
        SortButtonView()
    }
}
