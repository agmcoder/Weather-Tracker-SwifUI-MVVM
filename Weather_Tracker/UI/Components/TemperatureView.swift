//
//  TemperatureView.swift
//  Weather_Tracker
//
//  Created by agmcoder on 3/11/25.
//

import SwiftUI

struct TemperatureView: View {
    let temperature: Int
    let temperatureSize: CGFloat
    let degreeSymbolSize: CGFloat
    
    var body: some View {
        HStack(alignment: .firstTextBaseline, spacing: 2) {
            Text(String(temperature))
                .font(.poppinsExtraBold(size: temperatureSize))
                .foregroundColor(.text)
            
            Text(String.temperatureViewDegreeSymbol) //
                .font(.poppinsExtraBold(size: degreeSymbolSize))
                .foregroundColor(.text)
                .baselineOffset(temperatureSize * 0.5)
        }
    }
}
#Preview {
    TemperatureView(temperature: 25, temperatureSize: 70, degreeSymbolSize: 20)
}
