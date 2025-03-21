//
//  CitySelectedView.swift
//  Weather_Tracker
//
//  Created by agmcoder on 3/11/25.
//

import SwiftUI

struct CitySelectedView: View {
    @StateObject private var viewModel: CitySelectedViewModel

    init(weatherItem: Weather) {
        _viewModel = StateObject(wrappedValue: CitySelectedViewModel(weatherItem: weatherItem))
    }

    var body: some View {
        VStack() {
            WeatherIconView(
                imageName: viewModel.weatherItem.current.condition.iconURL,
                width: DesignConstants.CitySelectedView.IconSize.weatherWidth,
                height: DesignConstants.CitySelectedView.IconSize.weatherHeight
            )
            
            CityNameView(name: viewModel.weatherItem.location.name)
            
            TemperatureView(
                temperature: viewModel.weatherItem.current.temp_c_round,
                temperatureSize: DesignConstants.CitySelectedView.FontSize.temperature,
                degreeSymbolSize: DesignConstants.CitySelectedView.FontSize.degreeSymbol
            )
            
            WeatherDetailsCardView(details: [
                WeatherDetail(title: String.weatherHumidity, value: viewModel.humidity),
                WeatherDetail(title: String.weatherUVIndex, value: viewModel.uvIndex),
                WeatherDetail(title: String.weatherFeelsLike, value: viewModel.feelsLike)
            ])
        }
        .padding(.top, DesignConstants.Common.outerPadding)

        
        Spacer()
    }
}

// MARK: - Subviews
struct CityNameView: View {
    let name: String

    var body: some View {
        HStack {
            Text(name)
                .font(.poppinsBold(size: DesignConstants.CitySelectedView.FontSize.cityName))
                .multilineTextAlignment(.center)
                .foregroundColor(.text)
            Image("location_icon")
                .resizable()
                .frame(
                    width: DesignConstants.CitySelectedView.IconSize.locationWidth,
                    height: DesignConstants.CitySelectedView.IconSize.locationHeight
                )
        }
    }
}

struct WeatherDetailsCardView: View {
    let details: [WeatherDetail]

    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: DesignConstants.Common.cornerRadius)
                .fill(Color(.backGroundCard))
            
            HStack {
                Spacer()
                ForEach(details, id: \.title) { detail in
                    WeatherDetailItemView(title: detail.title, value: detail.value)
                    Spacer()
                }
            }
        }
        .frame(width: DesignConstants.CitySelectedView.detailCardWidth,
               height: DesignConstants.CitySelectedView.detailCardHeight)
    }
}

struct WeatherDetailItemView: View {
    let title: String
    let value: String

    var body: some View {
        VStack {
            Text(title)
                .font(.poppinsBold(size: DesignConstants.CitySelectedView.FontSize.weatherDetailTitle))
                .foregroundColor(.weatherDetailCardTitle)
            Text(value)
                .font(.poppinsBold(size: DesignConstants.CitySelectedView.FontSize.weatherDetailValue))
                .foregroundColor(.weatherDetailCardValue)
        }
    }
}

#Preview {
    CitySelectedView(weatherItem: Weather.mockWeather)
}
