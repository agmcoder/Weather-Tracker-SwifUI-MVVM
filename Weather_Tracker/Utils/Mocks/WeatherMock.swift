import Foundation

extension Weather {
    
    static var mockLocation: Location {
        return Location(
            name: "Madrid",
            region: "Madrid",
            country: "Spain",
            lat: 40.4,
            lon: -3.6833,
            tz_id: "Europe/Madrid",
            localtime_epoch: 1742060316,
            localtime: "2025-03-15 18:38"
        )
    }
    
    static var mockCurrentWeather: CurrentWeather {
        return CurrentWeather(
            last_updated_epoch: 1742059800,
            last_updated: "2025-03-15 18:30",
            temp_c: 8.1,
            temp_f: 46.6,
            is_day: 1,
            condition: WeatherCondition(text: "Sunny", icon: "//cdn.weatherapi.com/weather/64x64/day/113.png", code: 1000),
            wind_mph: 11.4,
            wind_kph: 18.4,
            wind_degree: 262,
            wind_dir: "W",
            pressure_mb: 1013,
            pressure_in: 29.91,
            precip_mm: 0,
            precip_in: 0,
            humidity: 57,
            cloud: 0,
            feelslike_c: 5.2,
            feelslike_f: 41.3,
            windchill_c: 7.5,
            windchill_f: 45.5,
            heatindex_c: 10,
            heatindex_f: 49.9,
            dewpoint_c: -0.6,
            dewpoint_f: 31,
            vis_km: 10,
            vis_miles: 6,
            uv: 0.3,
            gust_mph: 13.4,
            gust_kph: 21.5
        )
    }
    
    static var mockWeather: Weather {
        return Weather(location: mockLocation, current: mockCurrentWeather)
    }
}
