//
//  BaseAPI.swift
//  Weather_Tracker
//
//  Created by agmcoder on 3/20/25.
//

import Foundation

enum HTTPMethod: String {
    case GET
    case POST
    case PUT
    case DELETE
}


enum NetworkError: LocalizedError {
    case invalidURL
    case invalidResponse
    case decodingError

    var errorDescription: String? {
        switch self {
        case .invalidURL:
            return String.networkErrorInvalidURL
        case .invalidResponse:
            return String.networkErrorInvalidResponse
        case .decodingError:
            return String.networkErrorDecodingError
        }
    }
}

protocol BaseAPI {
    func request<T: Decodable>(
        endpoint: String,
        method: HTTPMethod,
        parameters: [String: String]?,
        headers: [String: String]?
    ) async throws -> T
}

class NetworkManager: BaseAPI {
    private let session: NetworkSession
    private let urlBuilder: URLBuilder

    init(session: NetworkSession = URLSession.shared, baseURL: String = Config.weatherAPIBaseURL) {
        self.session = session
        self.urlBuilder = URLBuilder(baseURL: baseURL)
    }

    func request<T: Decodable>(
        endpoint: String,
        method: HTTPMethod,
        parameters: [String: String]? = nil,
        headers: [String: String]? = nil
    ) async throws -> T {
        let url = try urlBuilder.buildURL(endpoint: endpoint, parameters: parameters)
        print("🌐 URL generada: \(url.absoluteString)")

        var request = URLRequest(url: url)
        request.httpMethod = method.rawValue

        if let headers = headers {
            for (key, value) in headers {
                request.addValue(value, forHTTPHeaderField: key)
            }
        }

        let (data, response) = try await session.data(for: request)

        guard let httpResponse = response as? HTTPURLResponse, (200...299).contains(httpResponse.statusCode) else {
            throw NetworkError.invalidResponse
        }

        print("📦 JSON recibido: \(String(data: data, encoding: .utf8) ?? "No data")")
        return try JSONDecoder.decode(T.self, from: data)
    }
}

extension JSONDecoder {
    static func decode<T: Decodable>(_ type: T.Type, from data: Data) throws -> T {
        do {
            return try JSONDecoder().decode(T.self, from: data)
        } catch {
            print("❌ Error al decodificar: \(error)")
            throw NetworkError.decodingError
        }
    }
}
