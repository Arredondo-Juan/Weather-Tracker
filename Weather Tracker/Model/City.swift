//
//  City.swift
//  Weather Tracker
//
//  Created by Juan Arredondo on 12/19/24.
//

import Foundation

struct City: Identifiable, Codable {
    let id = UUID()
    let name: String
    let temperature: Double
    let condition: String
    let icon: String
    let humidity: Int
    let uv: Double
    let feelsLike: Double
    
    enum CodingKeys: String, CodingKey {
        case location
        case current
    }
    
    enum LocationKeys: String, CodingKey {
        case name
    }
    
    enum CurrentKeys: String, CodingKey {
        case temp_c
        case condition
        case humidity
        case uv
        case feelslike_c
    }
    
    enum ConditionKeys: String, CodingKey {
        case text
        case icon
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        let locationContainer = try container.nestedContainer(keyedBy: LocationKeys.self, forKey: .location)
        name = try locationContainer.decode(String.self, forKey: .name)
        
        let currentContainer = try container.nestedContainer(keyedBy: CurrentKeys.self, forKey: .current)
        temperature = try currentContainer.decode(Double.self, forKey: .temp_c)
        feelsLike = try currentContainer.decode(Double.self, forKey: .feelslike_c)
        humidity = try currentContainer.decode(Int.self, forKey: .humidity)
        uv = try currentContainer.decode(Double.self, forKey: .uv)
        
        let conditionContainer = try currentContainer.nestedContainer(keyedBy: ConditionKeys.self, forKey: .condition)
        condition = try conditionContainer.decode(String.self, forKey: .text)
        icon = try conditionContainer.decode(String.self, forKey: .icon)
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        
        var locationContainer = container.nestedContainer(keyedBy: LocationKeys.self, forKey: .location)
        try locationContainer.encode(name, forKey: .name)
        
        var currentContainer = container.nestedContainer(keyedBy: CurrentKeys.self, forKey: .current)
        try currentContainer.encode(temperature, forKey: .temp_c)
        try currentContainer.encode(feelsLike, forKey: .feelslike_c)
        try currentContainer.encode(humidity, forKey: .humidity)
        try currentContainer.encode(uv, forKey: .uv)
        
        var conditionContainer = currentContainer.nestedContainer(keyedBy: ConditionKeys.self, forKey: .condition)
        try conditionContainer.encode(condition, forKey: .text)
        try conditionContainer.encode(icon, forKey: .icon)
    }
}
