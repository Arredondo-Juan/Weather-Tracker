//
//  SearchResultCard.swift
//  Weather Tracker
//
//  Created by Juan Arredondo on 12/19/24.
//

import SwiftUI

struct SearchResultCard: View {
    let city: City
    let onSelect: (City) -> Void
    
    var body: some View {
        Button(action: {
            onSelect(city)
        }) {
            HStack {
                Spacer()
                VStack(alignment: .center, spacing: 10) {
                    Text(city.name)
                        .font(.system(size: 20))
                        .fontWeight(.semibold)
                    Text("\(Int(city.temperature))°")
                        .font(.system(size: 60))
                }
                Spacer()
                Spacer()
                AsyncImage(url: URL(string: "https:\(city.icon)")) { image in
                    image
                        .resizable()
                        .frame(width: 83, height: 83)
                } placeholder: {
                    ProgressView()
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
