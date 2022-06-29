//
//  NetworkError.swift
//  SearchDataRepository
//
//  Created by Jinho Jang on 2022/06/29.
//  Copyright © 2022 org.AriseNShine. All rights reserved.
//

import Foundation

enum NetworkError: Error {
    case http(statusCode: Int)
    case noData
}

extension NetworkError: LocalizedError {
    var errorDescription: String? {
        switch self {
        case .http(let statusCode):
            return "Network error : \(statusCode)"
        case .noData:
            return "Network error : empty data"
        }
    }
}
