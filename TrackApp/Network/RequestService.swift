//
//  RequestService.swift
//  TrackApp
//
//  Created by Juan José Granados Moreno on 4/27/19.
//  Copyright © 2019 juanjogramo. All rights reserved.
//

import Foundation
import Alamofire

protocol Requestable {
    func request(withURLString urlString   : String,
                 verb                      : HTTPMethod,
                 parameters                : [String:Any]?,
                 encoding                  : JSONEncoding,
                 headers                   : HTTPHeaders,
                 completionHandler         : @escaping (AFResult<Any>) -> Void)
    
}

extension Requestable {
    func request(withURLString urlString   : String,
                 verb                      : HTTPMethod,
                 parameters                : [String:Any]?,
                 encoding                  : JSONEncoding,
                 headers                   : HTTPHeaders,
                 completionHandler         : @escaping (AFResult<Any>) -> Void){
        
        let request = AF.request(urlString, method: verb, parameters: parameters, encoding: encoding, headers: headers)
        
        request
            .validate()
            .responseJSON { (dataResponse) in
                completionHandler(dataResponse.result)
        }
    }
}
