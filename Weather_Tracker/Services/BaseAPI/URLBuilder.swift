//
//  URLBuilder.swift
//  Weather_Tracker
//
//  Created by agmcoder on 3/21/25.
//

import Foundation

struct URLBuilder {
    private let baseURL: String

    init(baseURL: String) {
        self.baseURL = baseURL
    }

    func buildURL(endpoint: String, parameters: [String: String]?) throws -> URL {
        var urlComponents = URLComponents(string: baseURL + endpoint)
        var queryItems = [URLQueryItem]()

        if let parameters = parameters {
            for (key, value) in parameters {
                queryItems.append(URLQueryItem(name: key, value: value))
            }
        }

        urlComponents?.queryItems = queryItems

        guard let url = urlComponents?.url else {
            throw NetworkError.invalidURL
        }

        return url
    }
}
