//
//  SearchAPI.swift
//  SearchDataRepository
//
//  Created by Jinho Jang on 2022/06/29.
//  Copyright © 2022 org.AriseNShine. All rights reserved.
//

struct SearchAPI {
    static func getAPI(_ query: String) -> API {
        API(host: "api.dictionaryapi.dev",
            path: "/api/v2/entries/en/\(query)")
    }
}

