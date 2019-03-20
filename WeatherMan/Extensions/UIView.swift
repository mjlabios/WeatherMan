//
//  UIView.swift
//  WeatherMan
//
//  Created by Mark Joie Labios on 3/18/19.
//  Copyright © 2019 Mark Joie Labios. All rights reserved.
//

import UIKit

import UIKit


extension UIView {
    
    enum viewBorder: String {
        case Left = "borderLeft"
        case Right = "borderRight"
        case Top = "borderTop"
        case Bottom = "borderBottom"
    }
    
    func addBorder(vBorders: [viewBorder], color: UIColor, width: CGFloat) {
        vBorders.forEach { vBorder in
            let border = CALayer()
            border.backgroundColor = color.cgColor
            border.name = vBorder.rawValue
            switch vBorder {
            case .Left:
                border.frame = CGRect(x: 0, y: 0, width: width, height: self.frame.size.height)
            case .Right:
                border.frame = CGRect(x:self.frame.size.width - width, y: 0, width: width, height: self.frame.size.height)
            case .Top:
                border.frame = CGRect(x: 0, y: 0, width: self.frame.size.width, height: width)
            case .Bottom:
                border.frame = CGRect(x: 0, y: self.frame.size.height - width , width: self.frame.size.width, height: width)
            }
            self.layer.addSublayer(border)
        }
    }
}
