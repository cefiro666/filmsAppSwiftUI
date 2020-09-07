//
//  FilmsNetwork.swift
//  FilmsAppSUI
//
//  Created by Виталий Баник on 28.08.2020.
//  Copyright © 2020 Виталий Баник. All rights reserved.
//

import Combine
import Foundation

struct FilmsNetwork: Network {

    var decoder: JSONDecoder = JSONDecoder()
    var environment: NetworkEnvironment = .films
}
