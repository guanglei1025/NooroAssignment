//
//  WeatherAPIService.swift
//  NooroAssignment
//
//  Created by Guanglei Liu on 1/21/25.
//

import Foundation
import SwiftData

class WeatherAPIService {

    private let key = "ad6c1da48de14e28bb935230252201"

    func getCurrentWeather(for keyword: String) async throws -> WeatherResponse {
        let urlString = "https://api.weatherapi.com/v1/current.json?key=\(key)&q=\(keyword)"
        guard let url = URL(string: urlString) else {
            throw URLError(.badURL)
        }

        let (data, response) = try await URLSession.shared.data(from: url)

        guard let httpResponse = response as? HTTPURLResponse,
              200..<300 ~= httpResponse.statusCode
        else {
            throw URLError(.badServerResponse)
        }

        return try JSONDecoder().decode(WeatherResponse.self, from: data)
    }
}
