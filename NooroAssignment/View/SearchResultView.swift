//
//  SearchResultView.swift
//  NooroAssignment
//
//  Created by Guanglei Liu on 1/21/25.
//

import SwiftUI
import SwiftData

struct SearchResultView: View {

    @Environment(WeatherViewModel.self) private var viewModel

    var body: some View {
        if let searchedWeather = viewModel.searchedWeather {
            HStack{
                VStack(alignment: .leading, spacing: 10) {
                    Text(searchedWeather.location.name)
                        .font(.system(size: 25, weight: .bold))

                    Text("\(Int(searchedWeather.current.tempF))")
                        .font(.system(size: 60, weight: .semibold))
                }

                Spacer()

                Image(systemName: "heart.fill")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 123, height: 123)
            }
            .frame(maxWidth: .infinity)
            .padding(20)
            .background(Color(.secondarySystemBackground))
            .cornerRadius(10)
            .onTapGesture {
                viewModel.saveToLocalStorage(searchedWeather)
            }
        } else {
            EmptyView()
        }
    }
}

#Preview {
    do {
        let modelContext = try ModelContext.mock()
        return SearchResultView()
            .environment(WeatherViewModel(modelContext: modelContext))
    } catch {
        fatalError("Filed to create SwiftUI preview")
    }
}
