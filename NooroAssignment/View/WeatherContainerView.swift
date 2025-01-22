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
        if viewModel.showSearchResult {
            SearchResultView()
        } else {
            WeatherView()
        }
    }
}

#Preview {
    WeatherContainerView()
}
