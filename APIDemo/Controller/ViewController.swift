//
//  ViewController.swift
//  APIDemo
//
//  Created by Student on 5/30/18.
//  Copyright © 2018 Student. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        NotificationCenter.default.addObserver(self, selector: #selector(updateUI), name: Notification.Name.init("update"), object: nil)
        DataService.share.getDataWeatherFromAPI()
    }
    @objc func updateUI() {
        print(DataService.share.weather?.name ?? "")
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    //        let url = URL(string: "https://api.apixu.com/v1/forecast.json?key=fc0bcf76aecc432ca4c21120182905&q=Hanoi&days=7&lang=vi")
    //        let wearther = URLSession.shared.dataTask(with: url!){data,response,error in
    //            if error != nil {
    //                print(error!)
    //            }else{
    //                if let urlContent = data {
    //                    do{
    //                        let jsonResult = try JSONSerialization.jsonObject(with: urlContent, options: JSONSerialization.ReadingOptions.mutableContainers) as AnyObject
    //                        print(jsonResult)
    ////                        print(jsonResult["name"]!!)
    //                    }
    //                    catch{
    //                        print("json Processing Failed")
    //                    }
    //                }
    //            }
    //        }
    //        wearther.resume()

}

