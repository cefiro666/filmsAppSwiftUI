//
//  Array+Extensions.swift
//  FilmsAppSUI
//
//  Created by Виталий Баник on 04.10.2020.
//  Copyright © 2020 Виталий Баник. All rights reserved.
//

import Foundation

extension Array {
    
    /**
    Returns unique elements from an array.
    */
    func unique<T: Hashable>(map: ((Element) -> (T))) -> [Element] {
        var set = Set<T>()
        var arrayOrdered = [Element]()
        for value in self {
            if !set.contains(map(value)) {
                set.insert(map(value))
                arrayOrdered.append(value)
            }
        }

        return arrayOrdered
    }
}
