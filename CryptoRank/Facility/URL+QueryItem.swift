//
//  URL+QueryItem.swift
//  URL+QueryItem
//
//  Created by lyzkov on 09/09/2021.
//

import Foundation

extension URL {

    func appendingQueryItem(name: String, value: String?) -> URL {
        guard var urlComponents = URLComponents(string: absoluteString) else {
            return self
        }

        var queryItems: [URLQueryItem] = urlComponents.queryItems ??  []
        let queryItem = URLQueryItem(name: name, value: value)
        queryItems.append(queryItem)
        urlComponents.queryItems = queryItems

        return urlComponents.url!
    }
}
