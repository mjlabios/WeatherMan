//
//  NoForeCastOverlay.swift
//  WeatherMan
//
//  Created by Mark Joie Labios on 19/03/2019.
//  Copyright © 2019 Mark Joie Labios. All rights reserved.
//

import Foundation
import UIKit

class NoForeCastOverlay: UIView {
    
    var noDataLabel: UILabel?
    private var loading: UIImageView?
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init() {
        super.init(frame: CGRect(x: 0, y:0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height))
        
        noDataLabel = UILabel(frame: CGRect(x:0, y: self.frame.height / 2, width: self.frame.width, height: 50))
        
        noDataLabel!.text = "No Data Fetched"
        noDataLabel!.textAlignment = .center
        self.addSubview(noDataLabel!)
        self.isHidden = true
        
        loadInit()
        
    }
    
    func hide() {
        self.isHidden = true
    }
    
    func show() {
        self.isHidden = false
    }
    
    private func loadInit() {
        loading = UIImageView(frame: CGRect(x: UIScreen.main.bounds.width/3, y: UIScreen.main.bounds.height/2, width: UIScreen.main.bounds.width/3, height: CGFloat(60)))
        loading?.contentMode = .center
        loading?.setGIFImage(name: "pickerLoading")
        loading?.isHidden = true
        self.addSubview(loading!)
    }
    
    func load() {
        loading?.isHidden = false
        noDataLabel?.isHidden = true
    }
    
    func stopLoading() {
        loading?.isHidden = true
        noDataLabel?.isHidden = false
    }
}
