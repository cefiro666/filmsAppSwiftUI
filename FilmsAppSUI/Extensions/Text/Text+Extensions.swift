//
//  Text+Extensions.swift
//  FilmsAppSUI
//
//  Created by Виталий Баник on 28.08.2020.
//  Copyright © 2020 Виталий Баник. All rights reserved.
//

import SwiftUI

extension Text {
    
    /**
    Formats text for a specific rating.
     
    **Parameters:**
        - raiting: film raiting.
    */
    @inlinable public static func fromRaiting(_ raiting: Float?) -> some View {
        guard let raiting = raiting else {
            return Text("-").foregroundColor(Color(#colorLiteral(red: 0.3707730174, green: 0.370819658, blue: 0.3707520962, alpha: 1)))
        }

        switch raiting {
        case 0.0..<5.0:
            return Text(verbatim: String(raiting)).foregroundColor(Color(#colorLiteral(red: 0.6980392157, green: 0.06274509804, blue: 0.2549019608, alpha: 1)))

        case 5.0..<7.0:
            return Text(verbatim: String(raiting)).foregroundColor(Color(#colorLiteral(red: 0.3707730174, green: 0.370819658, blue: 0.3707520962, alpha: 1)))

        default:
            return Text(verbatim: String(raiting)).foregroundColor(Color(#colorLiteral(red: 0.1301344633, green: 0.4840399623, blue: 0.001282582292, alpha: 1)))
        }
    }
    
}
