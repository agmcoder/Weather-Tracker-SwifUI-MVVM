//
//  SearchService.swift
//  Weather_Tracker
//
//  Created by agmcoder on 3/20/25.
//

import Foundation

protocol SearchServicing {
    func filterWeatherItems(_ items: [Weather], with searchText: String) -> [Weather]
}

final class SearchService: SearchServicing {
    func filterWeatherItems(_ items: [Weather], with searchText: String) -> [Weather] {
        guard !searchText.isEmpty else { return items }
        return items.filter { $0.location.name.lowercased().contains(searchText.lowercased()) }
    }
}
