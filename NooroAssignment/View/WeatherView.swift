//
//  WeatherView.swift
//  NooroAssignment
//
//  Created by Guanglei Liu on 1/21/25.
//

import SwiftUI

struct WeatherView: View {
    @Environment(WeatherViewModel.self) var viewModel

    @State private var locationName: String = "Pune"

    @State private var temperature: String = "45"

    @State private var humidity: String = "20%"

    @State private var uvLevel: String = "4"

    @State private var bodyTemperature: String = "38"

    var body: some View {
        VStack(spacing: 15) {
            Image(systemName: "heart.fill")
                .resizable()
                .scaledToFit()
                .frame(width: 123, height: 123)

            HStack(alignment: .center) {
                Text(locationName)
                    .font(.system(size: 35, weight: .bold))

                Image(systemName: "location.fill")
                    .imageScale(.large)
            }

            Text(temperature)
                .font(.system(size: 100, weight: .semibold))

            HStack(spacing: 50) {
                VerticalCell(title: "Humidity", subtitle: humidity)
                VerticalCell(title: "UV", subtitle: uvLevel)
                VerticalCell(title: "Feels Like", subtitle: bodyTemperature)
            }
            .padding(.vertical)
            .frame(maxWidth: .infinity)
            .background(Color(.secondarySystemBackground))
            .cornerRadius(10)
            .padding(.horizontal, 30)
        }
        .frame(maxWidth: .infinity)
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
        .environment(WeatherViewModel())
}
