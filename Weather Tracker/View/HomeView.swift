//
//  ContentView.swift
//  Weather Tracker
//
//  Created by Juan Arredondo on 12/19/24.
//

import SwiftUI

struct HomeView: View {
    @State private var query = ""
    @State private var city: City?
    @State private var selectedCity: City?
    @State private var errorMessage: String?
    private let selectedCityKey = "SelectedCity"
    
    var body: some View {
        VStack (alignment: .center) {
            HStack {
                TextField("Search Location", text: $query)
                    .onSubmit {
                        fetchWeather()
                    }
                Button {
                    fetchWeather()
                } label: {
                    Image(systemName: "magnifyingglass").foregroundStyle(Color(.systemGray3))
                }
            }
            .padding(.vertical, 15)
            .padding(.horizontal, 20)
            .clipShape(RoundedRectangle(cornerRadius: 15))
            .overlay(
                RoundedRectangle(cornerRadius: 16)
                    .stroke(Color(.systemFill), lineWidth: 1)
            )
            
            Spacer()
            
            if let selectedCity = selectedCity {
                SelectedCity(city: selectedCity)
                
            } else if let city = city {
                SearchResultCard(city: city, onSelect: { _ in
                    self.selectedCity = city
                    self.query = ""
                })
                
            } else if let errorMessage = errorMessage {
                Text(errorMessage)
                    .foregroundColor(.red)
                
            } else {
                VStack(spacing: 15) {
                    Text("No City Selected")
                        .font(.system(size: 30))
                        .bold()
                    Text("Please Search For A City")
                        .font(.system(size: 15))
                        .bold()
                }
            }
            
            Spacer()
        }
        .padding()
        .onAppear {
            loadSelectedCity()
        }
    }
    
    private func fetchWeather() {
        DataService().fetchCityWeather(for: query) { result in
            DispatchQueue.main.async {
                switch result {
                case .success(let city):
                    self.city = city
                    self.selectedCity = nil
                    self.errorMessage = nil
                    saveSelectedCity(city)
                case .failure(let error):
                    self.errorMessage = error.localizedDescription
                }
            }
        }
    }
    
    private func saveSelectedCity(_ city: City) {
        do {
            let data = try JSONEncoder().encode(city)
            UserDefaults.standard.set(data, forKey: selectedCityKey)
        } catch {
            print("Failed to save city: \(error.localizedDescription)")
        }
    }
    
    private func loadSelectedCity() {
        guard let data = UserDefaults.standard.data(forKey: selectedCityKey) else { return }
        do {
            let city = try JSONDecoder().decode(City.self, from: data)
            self.selectedCity = city
        } catch {
            print("Failed to load city: \(error.localizedDescription)")
        }
    }
}

#Preview {
    HomeView()
}
