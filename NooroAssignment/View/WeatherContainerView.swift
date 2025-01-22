//
//  WeatherContainerView.swift
//  NooroAssignment
//
//  Created by Guanglei Liu on 1/21/25.
//

import SwiftUI

struct WeatherContainerView: View {

    @Environment(WeatherViewModel.self) var viewModel

    var body: some View {
        VStack {
            SearchBar(searchKeyword: searchKeywordBinding)
                .padding(.horizontal)
                .padding(.vertical, 50)

            bodyContent
                .padding(.horizontal)

            Spacer()
        }
        .task {
            do {
                try await viewModel.getWeatherData()
            } catch {

            }
        }
    }

    @ViewBuilder
    private var bodyContent: some View {
        if viewModel.showSearchResult {
            SearchResultView()
        } else {
            WeatherView()
        }
    }

    private var searchKeywordBinding: Binding<String> {
        Binding(
            get: { viewModel.searchKeyword },
            set: { viewModel.searchKeyword = $0 }
        )
    }
}

#Preview {
    WeatherContainerView()
        .environment(WeatherViewModel())
}
