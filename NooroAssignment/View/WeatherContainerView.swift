//
//  WeatherContainerView.swift
//  NooroAssignment
//
//  Created by Guanglei Liu on 1/21/25.
//

import SwiftUI
import SwiftData

struct WeatherContainerView: View {

    @State private var viewModel: WeatherViewModel

    init(modelContext: ModelContext) {
        _viewModel = State(initialValue: WeatherViewModel(modelContext: modelContext))
    }

    var body: some View {
        VStack {
            SearchBar(searchKeyword: searchKeywordBinding)
                .padding(.horizontal)
                .padding(.vertical, 50)

            bodyContent
                .padding(.horizontal)

            Spacer()
        }
        .environment(viewModel)
    }

    @ViewBuilder
    private var bodyContent: some View {
        if let weather = viewModel.searchedWeather {
            SearchResultView(searchedWeather: weather)
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
    do {
        let modelContext = try ModelContext.mock()
        return WeatherContainerView(modelContext: modelContext)
    } catch {
        fatalError("Failed to create SwiftUI preview \(error)")
    }
}
