//
//  SearchResultView.swift
//  NooroAssignment
//
//  Created by Guanglei Liu on 1/21/25.
//

import SwiftUI

struct SearchResultView: View {

    let locationName: String = "New York"
    let temperature: String = "10°C"

    var body: some View {
        HStack{
            VStack(alignment: .leading, spacing: 10) {
                Text(locationName)
                    .font(.system(size: 25, weight: .bold))

                Text(temperature)
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
    }
}

#Preview {
    SearchResultView()
}
