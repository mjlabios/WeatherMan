//
//  Location.swift
//  WeatherMan
//
//  Created by Mark Joie Labios on 3/18/19.
//  Copyright © 2019 Mark Joie Labios. All rights reserved.
//

import Foundation

struct Location {
    // Keys
    private static let NAME_ID: String = "LocalizedName"
    private static let KEY_ID: String = "Key"
    // Object variables
    var name: String = ""
    var key: String = ""
    
    init(_ location: [String: Any]) {
        if let name = location[Location.NAME_ID] as? String {
            self.name = name
        }
        if let key = location[Location.KEY_ID] as? String {
            self.key = key
        }
    }
}
