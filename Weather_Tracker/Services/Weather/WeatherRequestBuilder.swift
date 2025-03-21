//
//  WeatherRequestBuilder.swift
//  Weather_Tracker
//
//  Created by agmcoder on 3/21/25.
//

import Foundation

struct WeatherRequestBuilder {
    private let apiKey: String

    init(apiKey: String) {
        self.apiKey = apiKey
    }

    func buildParameters(for city: String, additionalParameters: [String: String]?) -> [String: String] {
        var parameters: [String: String] = ["q": city, "key": apiKey]
        if let additionalParameters = additionalParameters {
            parameters.merge(additionalParameters) { _, new in new }
        }
        return parameters
    }

    func buildHeaders() -> [String: String] {
        return ["Content-Type": "application/json"]
    }
}
