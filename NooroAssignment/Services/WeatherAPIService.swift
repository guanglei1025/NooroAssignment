//
//  WeatherAPIService.swift
//  NooroAssignment
//
//  Created by Guanglei Liu on 1/21/25.
//

import Foundation

class WeatherAPIService {
    private var currentWeatherComponents: URLComponents = {
        var components = URLComponents()
        components.scheme = "https"
        components.host = "api.weatherapi.com"
        components.path = "/v1/current.json"
        components.queryItems = [
            URLQueryItem(name: "key", value: "ad6c1da48de14e28bb935230252201")
        ]
        return components
    }()

    func getCurrentWeather(for city: String) async throws {
        currentWeatherComponents.queryItems?.append(URLQueryItem(name: "q", value: city))
        guard let url = currentWeatherComponents.url else {
            throw URLError(.badURL)
        }

        let (data, response) = try await URLSession.shared.data(from: url)

        guard let httpResponse = response as? HTTPURLResponse,
              200..<300 ~= httpResponse.statusCode
        else {
            throw URLError(.badServerResponse)
        }

        print(String(data: data, encoding: .utf8) ?? "No data")
    }
}
