//
//  AppConfig.swift
//  WeatherMan
//
//  Created by Mark Joie Labios on 19/03/2019.
//  Copyright © 2019 Mark Joie Labios. All rights reserved.
//

import Foundation
import UIKit

public class AppConfig {
    // Picker Font
    public static let PICKER_FONT = "HelveticaNeue"
    // Picker Font Size
    public static let PICKER_FONT_SIZE = CGFloat(30)
    // Time Picker Predefined Values
    private static let PREDEFINED_TIME = [
        // Free Api calls for limited trial member account
        Time(name: "1 Hour", value: "1hour"),
        Time(name: "12 Hours", value: "12hour"),
        // Api key needs to be from an Elite member account -
        // https://developer.accuweather.com/accuweather-forecast-api/apis
        Time(name: "24 Hours", value: "24hour"),
        Time(name: "48 Hours", value: "48hour"),
        Time(name: "72 Hours", value: "72hour"),
        Time(name: "120 Hours", value: "120hour"),
    ]
    static func getPredefinedTime() -> [Time] {
        return PREDEFINED_TIME
    }
    
    public static let PICKERLOADING_GIF = "pickerLoading"
    
    
}
