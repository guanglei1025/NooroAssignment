//
//  WeatherView.swift
//  NooroAssignment
//
//  Created by Guanglei Liu on 1/21/25.
//

import SwiftUI

struct WeatherView: View {
    @Environment(WeatherViewModel.self) var viewModel

    var body: some View {
        Button("Tap") {
            viewModel.showSearchResult.toggle()
        }
    }
}

#Preview {
    WeatherView()
}
