//
//  CitySelectedViewModel.swift
//  Weather_Tracker
//
//  Created by agmcoder on 3/11/25.
//

import Foundation

protocol CitySelectedViewModelProtocol {
    var weatherItem: Weather { get }
    var humidity: String { get }
    var uvIndex: String { get }
    var feelsLike: String { get }
    
}

class CitySelectedViewModel: ObservableObject, CitySelectedViewModelProtocol {
    @Published var weatherItem: Weather
    
    var humidity: String {
        "\(weatherItem.current.humidity)%"
    }
    
    var uvIndex: String {
        "\(weatherItem.current.uv)"
    }
    
    var feelsLike: String {
        "\(weatherItem.current.feelslike_c_round)\(String.temperatureViewDegreeSymbol)"
    }
    
    init(weatherItem: Weather) {
        self.weatherItem = weatherItem
    }
}
