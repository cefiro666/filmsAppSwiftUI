//
//  View+Extensions.swift
//  FilmsAppSUI
//
//  Created by Виталий Баник on 07.09.2020.
//  Copyright © 2020 Виталий Баник. All rights reserved.
//

import SwiftUI

extension View {
    
    @inlinable public func eraseToAnyView() -> AnyView { AnyView(self) }
    
    @inlinable func `if`<Content: View>(_ conditional: Bool, content: (Self) -> Content) -> some View {
        return conditional ? AnyView(content(self)) : AnyView(self)
     }
}
