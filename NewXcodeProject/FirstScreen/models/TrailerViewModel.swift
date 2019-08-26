//
//  TrailerViewModel.swift
//  NewXcodeProject
//
//  Created by Fabio Acri on 22/08/2019.
//  Copyright © 2019 Fabio Acri. All rights reserved.
//

import Foundation
import UIKit.UIImage
import Combine

enum ModelState: String, CaseIterable {
    case initialised
    case retrieveImages
    case ready
    case redirected
    
    init() { self = .initialised}
}

final class TrailerViewModel: ObservableObject {
    
    @Published var publishedState = ModelState()
    var listOfTrailers = [TrailerModel]()
    private let urlSession = URLSession.shared
    typealias trailerObject = (url: String, name: String, redirected: String)
    
    func initModel() {
        prepareTrailersData()
    }
    
    private func prepareTrailersData() {
        publishedState = .retrieveImages
        
        appendImageUrls().enumerated().forEach { index, element in
            loadImage(index: index, trailerObject: element)
        }
    }
    
    private func appendImageUrls() -> [trailerObject] {
        return [
        trailerObject("https://trailers.apple.com/trailers/fox/underwater/images/poster_2x.jpg","Underwater","https://trailers.apple.com/trailers/fox/underwater/"),
        trailerObject("https://trailers.apple.com/trailers/independent/driven/images/poster_2x.jpg","Driven","https://trailers.apple.com/trailers/independent/driven/"),
        trailerObject("https://trailers.apple.com/trailers/sony/frankie/images/poster_2x.jpg","Frankie","https://trailers.apple.com/trailers/sony/frankie/"),
            trailerObject("https://trailers.apple.com/trailers/independent/can-you-keep-a-secret/images/poster_2x.jpg","Can you keep a secret?","https://trailers.apple.com/trailers/independent/can-you-keep-a-secret/"),
            trailerObject("https://trailers.apple.com/trailers/independent/fantastic-fungi/images/poster_2x.jpg","Fantastic Fungi","https://trailers.apple.com/trailers/independent/fantastic-fungi/"),
            trailerObject("https://trailers.apple.com/trailers/lions_gate/angel-has-fallen/images/poster_2x.jpg","Angel has fallen","https://trailers.apple.com/trailers/lions_gate/angel-has-fallen/")
        ]
    }
    
    private func loadImage(index: Int, trailerObject: trailerObject) {
        urlSession.dataTask(with: URL(string: trailerObject.url)!) { [weak self] data, response, error in
            guard let self = self, error == nil, let data = data else {
                return
            }
            
            self.listOfTrailers.append(TrailerModel(
                id: Int64(index),
                movieImage: UIImage(data: data)!,
                movieLabel: trailerObject.name,
                movieUrl: trailerObject.redirected)
            )
            
            if self.listOfTrailers.count == 6 {
                DispatchQueue.main.async {
                    self.publishedState = .ready
                }
            }
        }.resume()
    }
}
