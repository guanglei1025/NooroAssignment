//
//  CurrentWeather.swift
//  NooroAssignment
//
//  Created by Guanglei Liu on 1/26/25.
//

import Foundation
import SwiftData

@Model
class CurrentWeather: Decodable {
    var tempF: Double
    var humidity: Double
    var uv: Double
    var feelsLikeF: Double

    enum CodingKeys: String, CodingKey {
        case tempF = "temp_f"
        case humidity
        case uv
        case feelsLikeF = "feelslike_f"
    }

    init(tempF: Double, humidity: Double, uv: Double, feelsLikeF: Double) {
        self.tempF = tempF
        self.humidity = humidity
        self.uv = uv
        self.feelsLikeF = feelsLikeF
    }

    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.tempF = try container.decode(Double.self, forKey: .tempF)
        self.humidity = try container.decode(Double.self, forKey: .humidity)
        self.uv = try container.decode(Double.self, forKey: .uv)
        self.feelsLikeF = try container.decode(Double.self, forKey: .feelsLikeF)
    }
}
