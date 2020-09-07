//
//  Network.swift
//  FilmsAppSUI
//
//  Created by Виталий Баник on 04.09.2020.
//  Copyright © 2020 Виталий Баник. All rights reserved.
//

import Foundation
import Combine

protocol Network {

    var decoder: JSONDecoder { get set }
    var environment: NetworkEnvironment { get set }
}

extension Network {

    func fetch<T: Decodable>(route: NetworkRoute) -> AnyPublisher<T, Error> {

        let request = route.create(for: self.environment)

        return URLSession.shared
            .dataTaskPublisher(for: request)
            .tryCompactMap { result in
                try self.decoder.decode(T.self, from: result.data)
            }
            .receive(on: RunLoop.main)
            .eraseToAnyPublisher()
    }
    
}
