//
//  WeatherContainerView.swift
//  NooroAssignment
//
//  Created by Guanglei Liu on 1/21/25.
//

import SwiftUI
import SwiftData

struct WeatherContainerView: View {

    @Environment(WeatherViewModel.self) var viewModel
    @Environment(\.modelContext) private var modelContext

    var body: some View {
        VStack {
            SearchBar(searchKeyword: searchKeywordBinding)
                .padding(.horizontal)
                .padding(.vertical, 50)

            bodyContent
                .padding(.horizontal)

            Spacer()
        }
        .onAppear {
            viewModel.modelContext = modelContext
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
