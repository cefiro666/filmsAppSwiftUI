//
//  NetworkHelper.swift
//  FilmsListApp
//
//  Created by Виталий Баник on 06.02.2020.
//  Copyright © 2020 Виталий Баник. All rights reserved.
//

import Foundation
import Moya

// MARK: - HTTPHeaderField
struct HTTPHeaderField {
    
    static let contentType = "Content-Type"
    static let acceptType = "Accept"
}

// MARK: - ContentType
struct ContentType {
    
    static let json = "application/json"
}

// MARK: - baseURL
extension TargetType {

    var baseURL: URL {
        return URL(string: "https://s3-eu-west-1.amazonaws.com")!
    }
}
