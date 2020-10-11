//
//  GetFilmsUseCase.swift
//  FilmsListApp
//
//  Created by Виталий Баник on 06.02.2020.
//  Copyright © 2020 Виталий Баник. All rights reserved.
//

import Moya

// MARK: - GetFilmsUseCase
protocol GetFilmsUseCase {
    
// MARK: - Methods
    func execute(completion: @escaping (_ success: Bool, _ films: [Film], _ errorMessage: String?) -> ())
}

// MARK: - GetFilmsUseCaseImpl
class GetFilmsUseCaseImpl: GetFilmsUseCase {
    
// MARK: - Properties
    lazy var provider = MoyaProvider<FilmsProvider>()
    
// MARK: - Methods
    func execute(completion: @escaping (_ success: Bool, _ films: [Film], _ errorMessage: String?) -> ()) {
        
        self.provider.request(.getFilms) { result in
            switch result {
            case .success(let response):
                guard let films = try? response.map(FilmsResponse.self).films else {
                    completion(false, [], "Decoding error!")
                    return
                }
                
                completion(true, films, nil)
                
            case .failure(let error):
                completion(false, [], error.localizedDescription)
            }
        }
    }
    
}
