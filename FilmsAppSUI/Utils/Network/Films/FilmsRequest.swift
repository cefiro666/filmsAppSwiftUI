//
//  FilmsProvider.swift
//  FilmsListApp
//
//  Created by Виталий Баник on 06.02.2020.
//  Copyright © 2020 Виталий Баник. All rights reserved.
//

import Foundation
import Moya

// MARK: - FilmsProvider
enum FilmsProvider {
    
    case getFilms
}

// MARK: - TargetType
extension FilmsProvider: TargetType {
    
    var path: String {
        switch self {
        case .getFilms:
            return "/sequeniatesttask/films.json"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .getFilms:
            return .get
        }
    }
    
    var sampleData: Data {
        switch self {
        case .getFilms:
            let data = try? JSONEncoder().encode(FilmsResponse(films: [Film.placeholder]))
            return data ?? Data()
        }
    }
    
    var task: Task {
        switch self {
        case .getFilms:
            return Task.requestPlain
        }
    }
    
    var headers: [String : String]? {
        switch self {
        case .getFilms:
            return  [HTTPHeaderField.acceptType.rawValue: ContentType.json.rawValue]
        }
    }
}
