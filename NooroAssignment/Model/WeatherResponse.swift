//
//  WeatherResponse.swift
//  NooroAssignment
//
//  Created by Guanglei Liu on 1/22/25.
//

import Foundation

struct WeatherResponse: Codable {
    let location: Location
    let current: CurrentWeather
}

struct CurrentWeather: Codable {
    let tempF: Double
    let humidity: Double
    let uv: Int
    let feelsLikeF: Double

    enum CodingKeys: String, CodingKey {
        case tempF = "temp_f"
        case humidity
        case uv
        case feelsLikeF = "feelslike_f"
    }
}

struct Location: Codable {
    let name: String
    let country: String
}
