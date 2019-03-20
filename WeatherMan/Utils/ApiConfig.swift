//
//  ApiConfig.swift
//  WeatherMan
//
//  Created by Mark Joie Labios on 3/18/19.
//  Copyright © 2019 Mark Joie Labios. All rights reserved.
//

import Foundation

public class ApiConfig {
    //public static let APIKEY = "ZhJdrZN9VL8GVEZYFECSy7XHi1oWv5B3" // expired
    //public static let APIKEY = "I70J4WGg4vLfnn98QLLXVKgxFN2JwAgb" // expired
    public static let APIKEY = "9cAcWmjXiHL1ijLOGI2XUPkJIXRE8luH"
    public static let LOCATION_URL = "https://dataservice.accuweather.com/locations/v1/topcities/50?"
    public static let FORECAST_HOURLY_URL = "https://dataservice.accuweather.com/forecasts/v1/hourly/"
    public static let API_PARAMETER = ["apikey": APIKEY]
}
