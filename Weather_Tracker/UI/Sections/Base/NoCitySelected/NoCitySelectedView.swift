//
//  NoCitySelectedView.swift
//  Weather_Tracker
//
//  Created by agmcoder on 3/18/25.
//

import SwiftUI

struct NoCitySelectedView: View {
    var body: some View {
        VStack(alignment: .center) {
            Text(String.citySelectionNoCityTitle)
                .font(.poppinsBold(size: DesignConstants.NoCitySelectedView.FontSize.title))
                .foregroundColor(.text)
            
            Text(String.citySelectionNoCitySubtitle)
                .font(.poppinsBold(size: DesignConstants.NoCitySelectedView.FontSize.subtitle))
                .foregroundColor(.text)
        }
    }
}

#Preview {
    NoCitySelectedView()
}
