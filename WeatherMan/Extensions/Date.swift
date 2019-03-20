//
//  Date.swift
//  WeatherMan
//
//  Created by Mark Joie Labios on 3/18/19.
//  Copyright © 2019 Mark Joie Labios. All rights reserved.
//

import Foundation

extension Date {
    func monthAsString() -> String {
        let df = DateFormatter()
        df.setLocalizedDateFormatFromTemplate("MMM")
        return df.string(from: self)
    }
}
