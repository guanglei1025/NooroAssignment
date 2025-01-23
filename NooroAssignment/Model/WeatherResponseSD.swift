//
//  WeatherResponseSD.swift
//  NooroAssignment
//
//  Created by Guanglei Liu on 1/22/25.
//

import Foundation
import SwiftData

@Model
class WeatherResponseSD: Codable {
    var location: LocationSD
    var current: CurrentWeatherSD

    init(location: LocationSD, current: CurrentWeatherSD) {
        self.location = location
        self.current = current
    }

    enum CodingKeys: String, CodingKey {
        case location
        case current
    }

    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.location = try container.decode(LocationSD.self, forKey: .location)
        self.current = try container.decode(CurrentWeatherSD.self, forKey: .current)
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(location, forKey: .location)
        try container.encode(current, forKey: .current)
    }
}

class LocationSD: Codable {
    let name: String
    let country: String
}

class CurrentWeatherSD: Codable {
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

