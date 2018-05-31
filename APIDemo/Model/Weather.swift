//
//  Weather.swift
//  APIDemo
//
//  Created by Student on 5/30/18.
//  Copyright © 2018 Student. All rights reserved.
//

import Foundation

class Weather {
    
    var name: String
    var country: String
    var temp_c: Double
    var forecastday: [ForecastDay] = []
    
    init?(dictionary: DICT) {
        guard let location = dictionary["location"] as? DICT else { return nil }
        guard let name = location["name"] as? String else { return nil }
        guard let country = location["country"] as? String else { return nil }
        guard let current = dictionary["current"] as? DICT else { return nil }
        guard let temp_c = current["temp_c"] as? Double else { return nil }
        guard let forecast = dictionary["forecast"] as? DICT else { return nil }
        guard let forecastday = forecast["forecastday"] as? [DICT] else { return nil }
        for objecForecast in forecastday {
            if let dataForecast = ForecastDay(dictionary: objecForecast) {
                self.forecastday.append(dataForecast)
            }
        }
        self.name = name
        self.country = country
        self.temp_c = temp_c
    }
}
