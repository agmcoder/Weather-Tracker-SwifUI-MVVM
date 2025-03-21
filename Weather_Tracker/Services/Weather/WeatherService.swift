//
//  WeatherAPIService.swift
//  Weather_Tracker
//
//  Created by agmcoder on 3/20/25.
//

import Foundation

protocol WeatherServicing {
    func fetchWeather(for city: String, additionalParameters: [String: String]?) async throws -> Weather
}

class WeatherService: WeatherServicing {
    private let api: BaseAPI
    private let apiKeyManager: ApiKeyManaging
    private let errorHandler: WeatherErrorHandler

    init(
        api: BaseAPI = NetworkManager(),
        apiKeyManager: ApiKeyManaging = ApiKeyManager.shared,
        errorHandler: WeatherErrorHandler = WeatherErrorHandler()
    ) {
        self.api = api
        self.apiKeyManager = apiKeyManager
        self.errorHandler = errorHandler
    }

    func fetchWeather(for city: String, additionalParameters: [String: String]? = nil) async throws -> Weather {
        do {
            let apiKey = try await apiKeyManager.getApiKey(
                for: APIService.weather.serviceName,
                key: APIService.weather.apiKeyName
            )

            let requestBuilder = WeatherRequestBuilder(apiKey: apiKey)
            let parameters = requestBuilder.buildParameters(for: city, additionalParameters: additionalParameters)
            let headers = requestBuilder.buildHeaders()

            return try await api.request(endpoint: "/current.json", method: .GET, parameters: parameters, headers: headers)
        } catch let error as WeatherServiceError {
            throw error
        } catch {
            throw WeatherServiceError.networkError(message: error.localizedDescription)
        }
    }
}

// MARK: - ServiceErrors
enum WeatherServiceError: LocalizedError {
    case missingParameter(message: String)
    case invalidRequestURL(message: String)
    case locationNotFound(message: String)
    case invalidJson(message: String)
    case tooManyLocations(message: String)
    case internalServerError(message: String)
    case apiKeyNotProvided(message: String)
    case invalidApiKey(message: String)
    case quotaExceeded(message: String)
    case apiKeyDisabled(message: String)
    case accessDenied(message: String)
    case networkError(message: String)
    case unknownError(message: String)

    var errorDescription: String? {
        switch self {
        case .missingParameter(let message),
             .invalidRequestURL(let message),
             .locationNotFound(let message),
             .invalidJson(let message),
             .tooManyLocations(let message),
             .internalServerError(let message),
             .apiKeyNotProvided(let message),
             .invalidApiKey(let message),
             .quotaExceeded(let message),
             .apiKeyDisabled(let message),
             .accessDenied(let message),
             .networkError(let message),
             .unknownError(let message):
            return message
        }
    }
}
