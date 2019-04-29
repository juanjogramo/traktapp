//
//  Movie.swift
//  TrackApp
//
//  Created by Juan José Granados Moreno on 4/28/19.
//  Copyright © 2019 juanjogramo. All rights reserved.
//

import UIKit
import Alamofire

class Movie {
    var title: String
    var year: Int
    var description: String
    var urlImage: String
    var poster: UIImage
    
    init(title: String, year: Int, description: String, urlImage: String) {
        self.title = title
        self.year = year
        self.description = description
        self.urlImage = urlImage
        self.poster = UIImage()
    }
    
}

extension Movie: Requestable {
    
    func getPoster() -> UIImage {
        return UIImage()
    }
    
    
}
