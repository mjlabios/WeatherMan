//
//  Forecast.swift
//  WeatherMan
//
//  Created by Mark Joie Labios on 19/03/2019.
//  Copyright © 2019 Mark Joie Labios. All rights reserved.
//

import Foundation
import UIKit

struct Forecast {
    // Keys
    private static let WEATHER_ICON: String = "WeatherIcon"
    private static let ICON_PHRASE: String = "IconPhrase"
    private static let DATE_TIME: String = "EpochDateTime"
    private static let TEMPERATURE: String = "Temperature"
    private static let VALUE: String = "Value"
    private static let MOBILE_LINK: String = "MobileLink"
    // Object variables
    var weatherIcon = 0
    var weatherImage: UIImage = UIImage()
    var dateTime = ""
    var temperature = ""
    var iconPhrase = ""
    var mobileLink = ""
    
    
    init(_ forcastData: [String: Any]) {
        
        if let weatherIcon = forcastData[Forecast.WEATHER_ICON] as? Int {
            self.weatherIcon = weatherIcon
            self.weatherImage = catchIcon(number: weatherIcon)
            }
        
        if let iconPhrase = forcastData[Forecast.ICON_PHRASE] as? String {
            self.iconPhrase = iconPhrase
        }
        
        if let dateTime = forcastData[Forecast.DATE_TIME] as? Double {
            
            let date = Date(timeIntervalSince1970: dateTime)
            let dateFormatter = DateFormatter()
            dateFormatter.timeStyle = DateFormatter.Style.medium // Set time style
            //dateFormatter.dateStyle = DateFormatter.Style.medium // Set date style
            //dateFormatter.timeZone = self.timeZone
            let localDate = dateFormatter.string(from: date)
            
            self.dateTime = localDate
        }
        
        if let temperatureData = forcastData[Forecast.TEMPERATURE] as? [String: Any] {
            if let temp = temperatureData[Forecast.VALUE] as? Int {
                self.temperature = "\((temp - 32)*5/9)°C"
            }
        }
        
        if let mobileLink = forcastData[Forecast.MOBILE_LINK] as? String {
            self.mobileLink = mobileLink
        }
        
    }

    private func catchIcon(number: Int) -> UIImage {
        switch number {
        case 1...8 , 11...26, 29...32: return UIImage(named:"\(number)")!
        case 33...38: return UIImage(named: "7")!
        case 39...44: return UIImage(named: "17")!
        default: return UIImage(named: "1")!
        }
    }
}
