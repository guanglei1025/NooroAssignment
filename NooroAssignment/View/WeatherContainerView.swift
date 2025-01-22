//
//  WeatherContainerView.swift
//  NooroAssignment
//
//  Created by Guanglei Liu on 1/21/25.
//

import SwiftUI

struct WeatherContainerView: View {

    @Environment(WeatherViewModel.self) var viewModel

    @State private var searchKeyword: String = ""

    var body: some View {
        VStack {
            SearchBar(searchKeyword: $searchKeyword)
                .padding(.horizontal)
                .padding(.vertical, 50)

            bodyContent

            Spacer()
        }
        .onChange(of: searchKeyword) {
            print("search keyword changed to: \(searchKeyword)")
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
}

#Preview {
    WeatherContainerView()
        .environment(WeatherViewModel())
}
