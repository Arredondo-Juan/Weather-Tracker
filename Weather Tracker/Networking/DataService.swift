//
//  DataService.swift
//  Weather Tracker
//
//  Created by Juan Arredondo on 12/19/24.
//

import Foundation

class DataService {
    func fetchCityWeather(for cityName: String, completion: @escaping (Result<City, Error>) -> Void) {
        guard let apiKey = Bundle.main.object(forInfoDictionaryKey: "API_KEY") as? String else {
            completion(.failure(NSError(domain: "Missing API Key", code: 0, userInfo: nil)))
            return
        }
        
        let urlString = "https://api.weatherapi.com/v1/current.json?key=\(apiKey)&q=\(cityName)"
        
        guard let url = URL(string: urlString) else {
            completion(.failure(URLError(.badURL)))
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                completion(.failure(error))
                return
            }
            
            guard let data = data else {
                completion(.failure(URLError(.badServerResponse)))
                return
            }
            
            do {
                let city = try JSONDecoder().decode(City.self, from: data)
                completion(.success(city))
            } catch {
                completion(.failure(error))
            }
        }.resume()
    }
}
