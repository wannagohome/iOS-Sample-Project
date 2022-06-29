//
//  API.swift
//  SearchDataRepository
//
//  Created by Jinho Jang on 2022/06/29.
//  Copyright © 2022 org.AriseNShine. All rights reserved.
//

import Foundation

enum HTTPMethod: String {
    case get = "GET"
}

struct API {
    var scheme = "https"
    var host: String
    var path: String
    var method: HTTPMethod = .get
    var parameter: Encodable?
    
    var url: URL {
        var components = URLComponents()
        components.scheme = scheme
        components.host = host
        components.path = path
        
        return components.url!
    }
    
    var request: URLRequest {
        URLRequest(url: url)
    }
}
