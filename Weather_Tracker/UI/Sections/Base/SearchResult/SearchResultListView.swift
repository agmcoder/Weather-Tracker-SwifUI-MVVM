//
//  SearchResultView.swift
//  Weather_Tracker
//
//  Created by agmcoder on 2/25/25.
//

import SwiftUI

struct SearchResultListView: View {
    @ObservedObject private var baseViewModel: BaseViewModel

    private let weatherItems: [Weather]
    
    init(baseViewModel: BaseViewModel, weatherItems: [Weather]) {
        self.baseViewModel = baseViewModel
        self.weatherItems = weatherItems
    }
    
    var body: some View {
        ScrollView {
            LazyVStack {
                ForEach(weatherItems, id: \.location.name) { item in
                    Button(action: {
                        baseViewModel.select(weatherItem: item)
                    }) {
                        LocationCardView(weatherItem: item)
                    }
                }
            }
        }
    }
}

#Preview {
    
    SearchResultListView(baseViewModel: BaseViewModel(weatherService: WeatherService(), searchService: SearchService()), weatherItems: [Weather.mockWeather])
}
