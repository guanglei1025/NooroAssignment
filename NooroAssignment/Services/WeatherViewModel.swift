//
//  WeatherViewModel.swift
//  NooroAssignment
//
//  Created by Guanglei Liu on 1/21/25.
//

import Foundation
import Observation
import SwiftUI

@Observable
class WeatherViewModel {

    var searchKeyword: String = ""

    private var weatherService = WeatherAPIService()

    var showSearchResult: Bool {
        return searchKeyword.count > 3
    }

    func getWeatherData() async throws {
        _ = try await weatherService.getCurrentWeather(for: "miami")
    }
}
