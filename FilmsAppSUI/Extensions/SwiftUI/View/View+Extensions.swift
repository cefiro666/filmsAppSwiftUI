//
//  View+Extensions.swift
//  FilmsAppSUI
//
//  Created by Виталий Баник on 07.09.2020.
//  Copyright © 2020 Виталий Баник. All rights reserved.
//

import SwiftUI

extension View {
    
    /**
    This function will convert any view to AnyView.
     
    **Parameters:**
        - foo: a bit of randomness.
        - bar: a bunch more randomness.
    */
    @inlinable public func eraseToAnyView() -> AnyView { AnyView(self) }

}
