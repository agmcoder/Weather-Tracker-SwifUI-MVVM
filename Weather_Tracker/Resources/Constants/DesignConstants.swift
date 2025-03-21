//
//  DesignConstants.swift
//  Weather_Tracker
//
//  Created by agmcoder on 3/20/25.
//

import SwiftUI

struct DesignConstants {
    
    struct Common {
        static let cornerRadius: CGFloat = 16
        static let outerPadding: CGFloat = 16
    }
    
    struct NoCitySelectedView {
        struct FontSize {
            static let title: CGFloat = 30
            static let subtitle: CGFloat = 15
        }
    }
    
    struct LocationCard {
        static let width: CGFloat = 336
        static let height: CGFloat = 117
        static let padding: CGFloat = 16
        static let infoSpacing: CGFloat = 10 
        
        struct FontSize {
            static let cityName: CGFloat = 20
            static let temperature: CGFloat = 60
            static let degreeSymbol: CGFloat = 20
        }
        
        struct IconSize {
            static let weatherWidth: CGFloat = 83
            static let weatherHeight: CGFloat = 67
        }
    }
    
    struct CitySelectedView {
        static let detailCardWidth: CGFloat = 274
        static let detailCardHeight: CGFloat = 75
        static let contentSpacing: CGFloat = 16
        
        struct FontSize {
            static let cityName: CGFloat = 30
            static let temperature: CGFloat = 70
            static let degreeSymbol: CGFloat = 20
            static let weatherDetailTitle: CGFloat = 12
            static let weatherDetailValue: CGFloat = 15
        }
        
        struct IconSize {
            static let weatherWidth: CGFloat = 123
            static let weatherHeight: CGFloat = 123
            static let locationWidth: CGFloat = 21
            static let locationHeight: CGFloat = 21
        }
    }
}
