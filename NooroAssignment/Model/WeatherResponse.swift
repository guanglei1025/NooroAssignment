//
//  WeatherResponse.swift
//  NooroAssignment
//
//  Created by Guanglei Liu on 1/22/25.
//

import Foundation
import SwiftData

@Model
class WeatherResponse: Codable {
    var location: Location
    var current: CurrentWeather

    init(location: Location, current: CurrentWeather) {
        self.location = location
        self.current = current
    }

    enum CodingKeys: String, CodingKey {
        case location
        case current
    }

    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.location = try container.decode(Location.self, forKey: .location)
        self.current = try container.decode(CurrentWeather.self, forKey: .current)
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(location, forKey: .location)
        try container.encode(current, forKey: .current)
    }
}

class Location: Codable {
    let name: String
    let country: String
}

class CurrentWeather: Codable {
    let tempF: Int
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

