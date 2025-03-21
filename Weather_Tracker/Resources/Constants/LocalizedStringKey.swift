//
//  LocalizedStringKey.swift
//  Weather_Tracker
//
//  Created by agmcoder on 3/20/25.
//

import Foundation

enum LocalizedStringKey: String {
    case baseViewSearchablePrompt = "base_view_searchable_prompt"
    
    case citySelectionNoCityTitle = "city_selection_no_city_title"
    case citySelectionNoCitySubtitle = "city_selection_no_city_subTitle"
    
    case temperatureViewDegreeSymbol = "temperature_view_degree_symbol"
    
    case weatherFeelsLike = "weather_feels_like"
    case weatherHumidity = "weather_humidity"
    case weatherUVIndex = "weather_uv_index"
    
    case networkErrorDecodingError = "network_error_decoding_error"
    case networkErrorInvalidResponse = "network_error_invalid_response"
    case networkErrorInvalidURL = "network_error_invalid_url"
    
    
    var localized: String {
        return NSLocalizedString(self.rawValue, comment: "")
    }
}
