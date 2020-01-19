//
//  FlickrAPIClient.swift
//  TableViewOfCollectionViews
//
//  Created by Amy Alsaydi on 1/18/20.
//  Copyright © 2020 Amy Alsaydi. All rights reserved.
//


import Foundation
import NetworkHelper

struct FlikrAPIClient {
    
    static func getPhotos(searchQuery: String, completion: @escaping (Result<[Photo], AppError>)-> ()) {
        
        let endpointURL = "https://www.flickr.com/services/rest/?method=flickr.photos.search&api_key=\(SecretKeys.apiKey)&text=\(searchQuery)&radius=32&extras=url_m,description&per_page=&format=json&nojsoncallback=1"
    
    guard let url = URL(string: endpointURL) else {
        completion(.failure(.badURL(endpointURL))) //  assigning the competion handler a failure
        return
    }
    
    let request = URLRequest(url: url)
    
        NetworkHelper.shared.performDataTask(with: request) { (result) in
            switch result {
            case .failure(let appError):
                completion(.failure(.networkClientError(appError)))
            case .success(let data):
                do {
                    let results = try JSONDecoder().decode(PhotoSearch.self, from: data)
                    let photos = results.photos.photo
                    completion(.success(photos))
                } catch {
                    completion(.failure(.decodingError(error)))
                }
                
            }
        }
    }
    
    
}
