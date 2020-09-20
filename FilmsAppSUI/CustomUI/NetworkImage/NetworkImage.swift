//
//  NetworkImage.swift
//  FilmsAppSUI
//
//  Created by Виталий Баник on 04.09.2020.
//  Copyright © 2020 Виталий Баник. All rights reserved.
//

import SwiftUI
import Kingfisher
import UIKit

// MARK: - NetworkImage
public struct NetworkImage: SwiftUI.View {
    
// MARK: - Properties
    public let urlString: String
    public let placeholderImage: UIImage?
    public let failureImage: UIImage?
    
    @State private var image: UIImage? = nil
    private let defaultImage = UIImage(named: "defaultImage") ?? UIImage()
    
// MARK: - Inits
    init(urlString: String,
         placeholderImage: UIImage? = nil,
         failureImage: UIImage? = nil) {
        
        self.urlString = urlString
        self.placeholderImage = placeholderImage
        self.failureImage = failureImage
    }
    
// MARK: - body
    public var body: some SwiftUI.View {
        
        Image(uiImage: self.image ?? self.placeholderImage ?? self.defaultImage)
            .resizable()
            .aspectRatio(contentMode: .fit)
            .onAppear(perform: self.loadImage)
    }
    
// MARK: - Methods
    private func loadImage() {
        guard let imageURL = URL(string: self.urlString), self.image == nil else {
            self.image = self.failureImage ?? self.defaultImage
            return
        }
        
        KingfisherManager.shared.retrieveImage(with: imageURL, options: [.cacheOriginalImage]) { result in
            switch result {
            case .success(let imageResult):
                self.image = imageResult.image
                
            case .failure(let error):
                if error.isNotCurrentTask { return }
                self.image = self.failureImage ?? self.defaultImage
            }
        }
    }
}

// MARK: - PreviewProvider
struct NetworkImage_Previews: PreviewProvider {
    
    static var previews: some SwiftUI.View {
        NetworkImage(urlString: "https://www.apple.com/favicon.ico")
    }
    
}
