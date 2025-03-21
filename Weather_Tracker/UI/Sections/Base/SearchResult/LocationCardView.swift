
import Foundation
import SwiftUI

struct LocationCardView: View {
    let weatherItem: Weather
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: DesignConstants.Common.cornerRadius)
                .fill(Color(.backGroundCard))
            
            HStack(spacing: 0) {
                VStack(alignment: .leading, spacing: DesignConstants.LocationCard.infoSpacing) {
                    Text(weatherItem.location.name)
                        .font(.poppinsBold(size: DesignConstants.LocationCard.FontSize.cityName))
                        .foregroundColor(.text)
                    
                    TemperatureView(
                        temperature: weatherItem.current.temp_c_round,
                        temperatureSize: DesignConstants.LocationCard.FontSize.temperature,
                        degreeSymbolSize: DesignConstants.LocationCard.FontSize.degreeSymbol
                    )
                }
                
                Spacer() 
                
                WeatherIconView(
                    imageName: (weatherItem.current.condition.iconURL),
                    width: DesignConstants.LocationCard.IconSize.weatherWidth,
                    height: DesignConstants.LocationCard.IconSize.weatherHeight
                )
            }
            .padding(DesignConstants.LocationCard.padding)
        }
        .frame(width: DesignConstants.LocationCard.width,
               height: DesignConstants.LocationCard.height)
        .padding(DesignConstants.Common.outerPadding)
    }
}

#Preview {
    LocationCardView(weatherItem: Weather.mockWeather)
}
