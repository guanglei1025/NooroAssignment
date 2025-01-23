//
//  WeatherResponse.swift
//  NooroAssignment
//
//  Created by Guanglei Liu on 1/22/25.
//

import Foundation
import SwiftData

@Model
class WeatherResponse: Decodable {
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
}

@Model
class Location: Decodable {
    var name: String
    var country: String

    enum CodingKeys: String, CodingKey {
        case name
        case country
    }

    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.name = try container.decode(String.self, forKey: .name)
        self.country = try container.decode(String.self, forKey: .country)
    }
}

@Model
class CurrentWeather: Decodable {
    var tempF: Int
    var humidity: Double
    var uv: Int
    var feelsLikeF: Double

    enum CodingKeys: String, CodingKey {
        case tempF = "temp_f"
        case humidity
        case uv
        case feelsLikeF = "feelslike_f"
    }

    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.tempF = try container.decode(Int.self, forKey: .tempF)
        self.humidity = try container.decode(Double.self, forKey: .humidity)
        self.uv = try container.decode(Int.self, forKey: .uv)
        self.feelsLikeF = try container.decode(Double.self, forKey: .feelsLikeF)
    }
}

