//
//  BaseView.swift
//  Weather_Tracker
//
//  Created by agmcoder on 3/20/25.
//

import SwiftUI

// MARK: - Main BaseView
struct BaseView: View {
    @ObservedObject private var viewModel: BaseViewModel

    init(viewModel: BaseViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        NavigationStack {
            BaseViewContent(viewModel: viewModel) // Asegúrate de pasar el viewModel aquí
                .searchable(
                    text: $viewModel.searchText,
                    isPresented: $viewModel.isSearchingActive,
                    placement: .toolbar,
                    prompt: Text(String.baseViewSearchablePrompt)
                )
                .onSubmit(of: .search) {
                    handleSearchSubmission()
                }
        }
    }
    
    // MARK: - Search Handling
    private func handleSearchSubmission() {
        Task {
            print(">>> Search submitted")
            viewModel.isSearchingActive = false
            await viewModel.updateWeatherData()
        }
    }
}

// MARK: - Subviews
struct BaseViewContent: View {
    @ObservedObject var viewModel: BaseViewModel // Asegúrate de que esto esté aquí

    var body: some View {
        switch viewModel.currentViewState {
        case .noCitySelected:
            NoCitySelectedView()
                .transition(.move(edge: .bottom))
        case .citySelected(let weatherItem):
            CitySelectedView(weatherItem: weatherItem)
        case .searchingResults(let weatherItems):
            SearchResultListView(
                baseViewModel: viewModel,
                weatherItems: weatherItems
            )
        case .loading:
            ProgressView("Cargando...")
                .progressViewStyle(CircularProgressViewStyle())
        case .error(let message):
            Text("Error: \(message)")
                .foregroundColor(.red)
                .padding()
        }
    }
}

// MARK: - Preview
#Preview {
    BaseView(viewModel: BaseViewModel(weatherService: WeatherService(), searchService: SearchService()))
}
