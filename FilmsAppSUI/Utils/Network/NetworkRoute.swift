//
//  NetworkRoute.swift
//  FilmsAppSUI
//
//  Created by Виталий Баник on 04.09.2020.
//  Copyright © 2020 Виталий Баник. All rights reserved.
//

import Foundation

// MARK: - NetworkRoute
protocol NetworkRoute {

    var path: String { get }
    var method: NetworkMethod { get }
    var headers: [String: String]? { get }
}

// MARK: - NetworkRoute
extension NetworkRoute {

    var headers: [String : String]? {
        return nil
    }

    func create(for enviroment: NetworkEnvironment) -> URLRequest {

        var request = URLRequest(url: URL(string: enviroment.rawValue + path)!)
        request.allHTTPHeaderFields = headers
        request.httpMethod = method.rawValue.uppercased()

        return request
    }
    
}
