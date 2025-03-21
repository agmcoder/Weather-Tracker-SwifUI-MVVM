//
//  URLSession+NetworkManager.swift
//  Weather_Tracker
//
//  Created by agmcoder on 3/21/25.
//

import Foundation

protocol NetworkSession {
    func data(for request: URLRequest) async throws -> (Data, URLResponse)
}

extension URLSession: NetworkSession {}
