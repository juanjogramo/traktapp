//
//  Config.swift
//  TrackApp
//
//  Created by Juan José Granados Moreno on 4/27/19.
//  Copyright © 2019 juanjogramo. All rights reserved.
//

import Foundation

enum Config {
    static let clientId = "b43ec1af8a64a5296fbfb9ce925c1a24018bdee01ab3790d99f91f184796a4a3"
    static let clientSecret = "b3e33458f47f3f4491c8b8a71a64f19b973fb72fa073ab4ae968a025c46011ef"
    static let code = "6a27f449df9551128d4133f73f53d3c4ec90252cb96fc14e4f56ef47bb85890a"
    static let authorization = "Bearer c01c85a59bd027e0ad4102ad874345eaba983ed6296b23755679ab910b8b8e0f"
    static let apiVersion = "2"
}

enum Identifiers {
    enum Cell {
        static let movie = "movieCellIdentifier"
    }
}

enum TableCell {
    static let movie = "MovieTableViewCell"
}

enum API {
    
    case movies(Int)
    
    var url: String {
        switch self {
        case .movies(let page):
            return "https://api.trakt.tv/movies/popular?page=\(page)&limit=10&extended=full"
        }
    }
    
}
