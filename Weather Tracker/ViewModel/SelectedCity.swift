//
//  SelectedCity.swift
//  Weather Tracker
//
//  Created by Juan Arredondo on 12/19/24.
//

import SwiftUI

struct SelectedCity: View {
    let city: City
    
    var body: some View {
        VStack(alignment: .center, spacing: 20) {
            AsyncImage(url: URL(string: "https:\(city.icon)")) { image in
                image
                    .resizable()
                    .frame(width: 123, height: 123)
            } placeholder: {
                ProgressView()
            }
            
            Text(city.name)
                .font(.system(size: 30))
                .fontWeight(.bold)
            
            Text("\(Int(city.temperature))°")
                .font(.system(size: 70))
            
            HStack(spacing: 20) {
                Spacer()
                VStack(alignment: .center, spacing: 10) {
                    Text("Humidity")
                        .font(.system(size: 12))
                    Text("\(city.humidity)%")
                        .font(.system(size: 15))
                        .fontWeight(.semibold)
                }
                Spacer()
                VStack(alignment: .center, spacing: 10) {
                    Text("UV")
                        .font(.system(size: 12))
                    Text("\(city.uv, specifier: "%.1f")")
                        .font(.system(size: 15))
                        .fontWeight(.semibold)
                }
                Spacer()
                VStack(alignment: .center, spacing: 10) {
                    Text("Feels Like")
                        .font(.system(size: 12))
                    Text("\(Int(city.feelsLike))°")
                        .font(.system(size: 15))
                        .fontWeight(.semibold)
                }
                Spacer()
            }
            .frame(maxWidth: .infinity)
            .foregroundColor(.black)
            .padding(.vertical, 30)
            .background(Color(.systemGray4))
            .cornerRadius(12)
            .padding(.horizontal, 20)
        }
    }
}
