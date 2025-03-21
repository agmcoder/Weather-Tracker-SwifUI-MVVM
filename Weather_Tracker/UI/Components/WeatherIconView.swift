//
//  WeatherIconView.swift
//  Weather_Tracker
//
//  Created by agmcoder on 3/11/25.
//

import SwiftUI

// MARK: - WeatherIconView
struct WeatherIconView: View {
    let imageName: URL
    let width: CGFloat
    let height: CGFloat
    
    var body: some View {
        AsyncImage(url: imageName) { image in
            image
                .resizable()
                .scaledToFit()
                .frame(width: width, height: height)
        } placeholder: {
            ProgressView()
        }
    }
}

#Preview {
    WeatherIconView(
        imageName: Weather.mockWeather.current.condition.iconURL,
        width: DesignConstants.CitySelectedView.IconSize.weatherWidth,
        height: DesignConstants.CitySelectedView.IconSize.weatherHeight)
}
