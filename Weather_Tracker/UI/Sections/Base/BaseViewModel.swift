//
//  BaseViewModel.swift
//  Weather_Tracker
//
//  Created by agmcoder on 3/20/25.
//

import Foundation

// MARK: - ViewState Enum
enum ViewState {
    case noCitySelected
    case citySelected(Weather)
    case searchingResults([Weather])
    case loading
    case error(String)
}

// MARK: - Protocol
protocol BaseViewModelProtocol: ObservableObject {
    var searchText: String { get set }
    var isSearchingActive: Bool { get set }
    var currentViewState: ViewState { get set }
    
    func updateWeatherData() async
    func select(weatherItem: Weather)
}

// MARK: - BaseViewModel
@MainActor
final class BaseViewModel: @preconcurrency BaseViewModelProtocol, ObservableObject {
    @Published var searchText: String = ""
    @Published var isSearchingActive: Bool = false
    @Published var currentViewState: ViewState = .noCitySelected
    @Published var weatherItems: Set<Weather> = []
    @Published var selectedWeatherItem: Weather? = nil

    private let weatherService: WeatherServicing
    private let searchService: SearchServicing

    // MARK: - Initialization
    init(weatherService: WeatherServicing, searchService: SearchServicing, initialWeatherItems: [Weather] = []) {
        self.weatherService = weatherService
        self.searchService = searchService
        self.weatherItems = Set(initialWeatherItems)
<<<<<<< HEAD
        updateCurrentState()
=======

        // Cargar datos desde UserDefaults al iniciar
        if let savedWeather = UserDefaults.standard.loadWeather() {
            self.selectedWeatherItem = savedWeather
            updateCitySelectedState(savedWeather)
        } else {
            updateCurrentState()
        }
>>>>>>> 6293a98 (Local Storage)
    }

    // MARK: - Public Methods
    func select(weatherItem: Weather) {
        selectedWeatherItem = weatherItem
<<<<<<< HEAD
=======
        UserDefaults.standard.saveWeather(weatherItem) // Guardar en UserDefaults
>>>>>>> 6293a98 (Local Storage)
        updateCitySelectedState(weatherItem)
    }

    func updateWeatherData() async {
        currentViewState = .loading
        do {
            let newWeatherItem = try await weatherService.fetchWeather(for: searchText, additionalParameters: nil)
            weatherItems.insert(newWeatherItem)
<<<<<<< HEAD
=======
            UserDefaults.standard.saveWeather(newWeatherItem) // Guardar en UserDefaults
>>>>>>> 6293a98 (Local Storage)
            updateSearchingState()
        } catch {
            currentViewState = .error(error.localizedDescription)
        }
        searchText = "" // Limpia la barra de búsqueda
    }

    // MARK: - Private Methods
    private func updateCurrentState() {
        if isSearchingActive || !searchText.isEmpty {
            updateSearchingState()
        } else if let selected = selectedWeatherItem {
            updateCitySelectedState(selected)
        } else {
            currentViewState = .noCitySelected
        }
    }

    private func updateSearchingState() {
        let filteredItems = searchService.filterWeatherItems(Array(weatherItems), with: searchText)
        currentViewState = .searchingResults(filteredItems)
    }

    private func updateCitySelectedState(_ weatherItem: Weather) {
        currentViewState = .citySelected(weatherItem)
    }
}
