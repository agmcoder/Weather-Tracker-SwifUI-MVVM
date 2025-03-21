//
//  Keys.swift
//  Weather_Tracker
//
//  Created by agmcoder on 3/21/25.
//

import Foundation

extension UserDefaults {
    private enum Keys {
        static let selectedWeather = "selectedWeather"
    }

    func saveWeather(_ weather: Weather) {
        let encoder = JSONEncoder()
        if let encodedWeather = try? encoder.encode(weather) {
            set(encodedWeather, forKey: Keys.selectedWeather)
        }
    }

    func loadWeather() -> Weather? {
        if let savedWeatherData = data(forKey: Keys.selectedWeather) {
            let decoder = JSONDecoder()
            return try? decoder.decode(Weather.self, from: savedWeatherData)
        }
        return nil
    }
}
