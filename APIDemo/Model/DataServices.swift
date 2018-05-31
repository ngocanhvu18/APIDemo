//
//  DataServices.swift
//  APIDemo
//
//  Created by Student on 5/30/18.
//  Copyright © 2018 Student. All rights reserved.
//

import UIKit

typealias DICT = Dictionary<AnyHashable, Any>

class DataService {
    static let share : DataService = DataService()
    
    var weather:Weather?
    func getDataWeatherFromAPI() {
        guard let urlString = URL(string: "https://api.apixu.com/v1/forecast.json?key=fc0bcf76aecc432ca4c21120182905&q=Hanoi&days=7&lang=vi") else { return  }
        let urlRequest = URLRequest(url: urlString)
        DispatchQueue.global().async {
            let weatherTask = URLSession.shared.dataTask(with: urlRequest, completionHandler: { (data, response, error) in
                guard error == nil else {
                    print(error!.localizedDescription)
                    return
                }
                guard let dataWeather = data else {return}
                do {
                    guard let results =  try JSONSerialization.jsonObject(with: dataWeather, options: .mutableContainers) as? DICT else {return}
                    self.weather = Weather(dictionary: results)
                    DispatchQueue.main.async {
                        NotificationCenter.default.post(name: Notification.Name.init("update"), object: nil)
                    }
                }
                catch {
                    print(error.localizedDescription)
                }
            })
            weatherTask.resume()
        }
    }
}
