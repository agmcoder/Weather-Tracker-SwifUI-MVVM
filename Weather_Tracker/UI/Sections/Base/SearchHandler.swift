//
//  SearchHandler.swift
//  Weather_Tracker
//
//  Created by agmcoder on 3/20/25.
//
import Foundation

class SearchHandler {
    private let weatherItems: [Weather]
    private var searchText: String
    
    init(weatherItems: [Weather], searchText: String) {
        self.weatherItems = weatherItems
        self.searchText = searchText
    }
    
    func updateSearchText(_ searchText: String) {
        self.searchText = searchText
    }
    
    func filteredWeatherItems() -> [Weather] {
        if searchText.isEmpty {
            return weatherItems
        } else {
            return weatherItems.filter { $0.location.name.localizedCaseInsensitiveContains(searchText) }
        }
    }
}
