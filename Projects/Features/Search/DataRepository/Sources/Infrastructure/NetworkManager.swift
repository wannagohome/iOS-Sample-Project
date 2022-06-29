//
//  NetworkManager.swift
//  SearchDataRepository
//
//  Created by Jinho Jang on 2022/06/29.
//  Copyright © 2022 org.AriseNShine. All rights reserved.
//

import Foundation
import RxSwift

protocol URLSessionType {
    func dataTask(
        with request: URLRequest,
        completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void
    ) -> URLSessionDataTask
}

extension URLSession: URLSessionType {}

protocol NetworkManagerType {
    func request(_ request: URLRequest) -> Single<Data>
}

final class NetworkManager: NetworkManagerType {
    private let session: URLSessionType
    
    init(session: URLSessionType = URLSession.shared) {
        self.session = session
    }
    
    func request(_ request: URLRequest) -> Single<Data> {
        return Single.create { [weak self] single in
            let dataTask = self?.session.dataTask(with: request) { data, response, error in
                if let error = error {
                    single(.failure(error))
                    return
                }
                guard let statusCode = (response as? HTTPURLResponse)?.statusCode else {
                    fatalError("This request is not http. Check your scheme of URL.")
                }
                if statusCode >= 300 || statusCode < 200 {
                    single(.failure(NetworkError.http(statusCode: statusCode)))
                    return
                }
                
                guard let data = data else {
                    single(.failure(NetworkError.noData))
                    return
                }
                single(.success(data))
            }
            
            dataTask?.resume()
            
            return Disposables.create {
                dataTask?.cancel()
            }
        }.retry(3)
    }
}
