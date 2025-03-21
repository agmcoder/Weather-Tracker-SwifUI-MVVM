//
//  Weather_TrackerApp.swift
//  Weather_Tracker
//
//  Created by agmcoder on 3/20/25.
//

import SwiftUI

@main
struct Weather_TrackerApp: App {
    
    var body: some Scene {
        WindowGroup {
            BaseView(viewModel: BaseViewModel(
                weatherService: WeatherService(),
                searchService: SearchService()))
        }
    }
}
