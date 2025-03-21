//
//  Location.swift
//  Weather_Tracker
//
//  Created by agmcoder on 3/20/25.
//

import Foundation

// MARK: - Weather
struct Weather: Codable, Hashable {
    let location: Location
    let current: CurrentWeather
    
    enum CodingKeys: String, CodingKey {
        case location
        case current
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(location.name)
    }
    
    static func == (lhs: Weather, rhs: Weather) -> Bool {
        return lhs.location.name == rhs.location.name
    }
}

// MARK: - Location
struct Location: Codable {
    let name: String
    let region: String
    let country: String
    let lat: Double
    let lon: Double
    let tz_id: String
    let localtime_epoch: Int
    let localtime: String
}

// MARK: - CurrentWeather
struct CurrentWeather: Codable {
    let last_updated_epoch: Int
    let last_updated: String
    let temp_c: Double
    let temp_f: Double
    let is_day: Int
    let condition: WeatherCondition
    let wind_mph: Double
    let wind_kph: Double
    let wind_degree: Int
    let wind_dir: String
    let pressure_mb: Double
    let pressure_in: Double
    let precip_mm: Double
    let precip_in: Double
    let humidity: Int
    let cloud: Int
    let feelslike_c: Double
    let feelslike_f: Double
    let windchill_c: Double
    let windchill_f: Double
    let heatindex_c: Double
    let heatindex_f: Double
    let dewpoint_c: Double
    let dewpoint_f: Double
    let vis_km: Double
    let vis_miles: Double
    let uv: Double
    let gust_mph: Double
    let gust_kph: Double
    
    var temp_c_round: Int {
        return Int(round(temp_c))
    }
    var feelslike_c_round: Int {
        return Int(round(feelslike_c))
    }
}

// MARK: - WeatherCondition
struct WeatherCondition: Codable {
    let text: String
    let icon: String
    let code: Int
    
    var iconURL: URL {
        if let url = URL(string: "https:" + icon) {
            return url
        } else {
            return Bundle.main.url(forResource: "default-icon", withExtension: "svg")!
        }
    }
}
