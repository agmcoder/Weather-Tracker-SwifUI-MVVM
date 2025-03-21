//
//  KeyManager.swift
//  Weather_Tracker
//
//  Created by agmcoder on 3/20/25.
//

import Foundation

protocol ApiKeyLoader {
    func loadApiKeys(for service: String) async throws -> [String: String]
}

class OnDemandApiKeyLoader: ApiKeyLoader {
    func loadApiKeys(for service: String) async throws -> [String: String] {
        let apiKeys = "APIKeys"
        let request = NSBundleResourceRequest(tags: [apiKeys])
        try await request.beginAccessingResources()
        
        defer { request.endAccessingResources() }
        
        guard let url = Bundle.main.url(forResource: apiKeys, withExtension: "json") else {
            throw ApiKeyError.resourceNotFound(service: "APIKeys.json")
        }
        
        let data = try Data(contentsOf: url)
        let allKeys = try JSONDecoder().decode([String: [String: String]].self, from: data)
        
        guard let serviceKeys = allKeys[service] else {
            throw ApiKeyError.serviceNotFound(service: service)
        }
        
        return serviceKeys
    }
}

protocol ApiKeyManaging {
    func getApiKey(for service: String, key: String) async throws -> String
}

class ApiKeyManager: ApiKeyManaging {
    static let shared = ApiKeyManager(loader: OnDemandApiKeyLoader())
    
    private let loader: ApiKeyLoader
    private var cache: [String: [String: String]] = [:]
    
    private init(loader: ApiKeyLoader) {
        self.loader = loader
    }
    
    func getApiKey(for service: String, key: String) async throws -> String {
        if let cachedKeys = cache[service] {
            guard let apiKey = cachedKeys[key] else {
                throw ApiKeyError.keyNotFound(service: service, key: key)
            }
            return apiKey
        }
        
        let keys = try await loader.loadApiKeys(for: service)
        cache[service] = keys
        
        guard let apiKey = keys[key] else {
            throw ApiKeyError.keyNotFound(service: service, key: key)
        }
        return apiKey
    }
}

enum APIService {
    case weather

    var serviceName: String {
        switch self {
        case .weather: return "WeatherService"
        }
    }

    var apiKeyName: String {
        switch self {
        case .weather: return "apiKey"
        }
    }
}

enum ApiKeyError: Error {
    case resourceNotFound(service: String)
    case keyNotFound(service: String, key: String)
    case serviceNotFound(service: String)
}
