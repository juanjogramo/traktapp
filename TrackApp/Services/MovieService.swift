//
//  MovieService.swift
//  TrackApp
//
//  Created by Juan José Granados Moreno on 4/29/19.
//  Copyright © 2019 juanjogramo. All rights reserved.
//

import Alamofire

class MovieService: Requestable {
    
    static let shared = MovieService()
    
    enum MovieResult {
        case success([Movie])
        case failure(Error)
    }
    
    func fetchMovies(onPage page: Int, _ completion:@escaping (MovieResult) -> Void){
        let moviesURL = API.movies(page).url
        let headers: HTTPHeaders = [
            "Content-type": "application/json",
            "trakt-api-key": Config.clientId,
            "trakt-api-version": Config.apiVersion,
            "Authorization": Config.authorization]
        
        request(withURLString: moviesURL, verb: .get, parameters: nil, encoding: .default, headers: headers) { (result) in
            switch result {
                
            case .success(let value):
                guard let json = value as? Array<Dictionary<String,Any>> else { return }
                let movies = json.map {
                    return Movie(title: $0["title"] as? String ?? "",
                                 year: $0["year"] as? Int ?? 0,
                                 description: $0["overview"] as? String ?? "",
                                 urlImage: "")
                }
                completion(.success(movies))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
