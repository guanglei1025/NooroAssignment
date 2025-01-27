//
//  WeatherResponse+Preview.swift
//  NooroAssignment
//
//  Created by Guanglei Liu on 1/26/25.
//

import Foundation

extension Weather {
    static func mock() -> Weather {
        Weather(
            location: Location(name: "Miami", country: "USA"),
            current: CurrentWeather(tempF: 80, humidity: 10, uv: 5, feelsLikeF: 85)
        )
    }
}
