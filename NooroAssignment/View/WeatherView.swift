//
//  WeatherView.swift
//  NooroAssignment
//
//  Created by Guanglei Liu on 1/21/25.
//

import SwiftUI
import SwiftData

struct WeatherView: View {
    @Environment(WeatherViewModel.self) var viewModel

    @Query
    var weathers: [WeatherResponse]

    var body: some View {
        Group {
            if let weather = weathers.first {
                bodyContent(for: weather)
            } else {
                noContent
            }
        }
        .task {
            if let weather = weathers.first {
                await viewModel.getWeatherForSavedLocation()
            }
        }
    }

    @ViewBuilder
    private func bodyContent(for weather: WeatherResponse) -> some View {
        VStack(spacing: 20) {
            Image(systemName: "heart.fill")
                .resizable()
                .scaledToFit()
                .frame(width: 123, height: 123)

            HStack(alignment: .center) {
                Text(weather.location.name)
                    .font(.system(size: 35, weight: .bold))

                Image(systemName: "location.fill")
                    .imageScale(.large)
            }

            Text("\(Int(weather.current.tempF))")
                .font(.system(size: 100, weight: .semibold))

            HStack(spacing: 50) {
                VerticalCell(title: "Humidity", subtitle: "\(weather.current.humidity)")
                VerticalCell(title: "UV", subtitle: "\(weather.current.uv)")
                VerticalCell(title: "Feels Like", subtitle: "\(weather.current.feelsLikeF)")
            }
            .padding(.vertical)
            .frame(maxWidth: .infinity)
            .background(Color(.secondarySystemBackground))
            .cornerRadius(10)
        }
    }

    @ViewBuilder
    private var noContent: some View {
        VStack(spacing: 20) {
            Text("No City Selected")
                .font(.system(size: 35, weight: .bold))

            Text("Please Search For A City")
                .font(.system(size: 20, weight: .bold))
        }
        .padding(.top, 150)
    }
}

struct VerticalCell : View {
    let title: String
    let subtitle: String

    var body: some View {
        VStack(spacing: 10) {
            Text(title)
                .foregroundStyle(.secondary)

            Text(subtitle)
                .foregroundStyle(.secondary)
                .fontWeight(.semibold)
        }
    }
}

#Preview {
    WeatherView()
//        .environment(WeatherViewModel())
}
