//
//  RootViewController.swift
//  WeatherMan
//
//  Created by Mark Joie Labios on 3/18/19.
//  Copyright © 2019 Mark Joie Labios. All rights reserved.
//

import UIKit

class RootViewController: UIViewController {
    
    // Constants
    private let LOCATION_TAG = 1
    private let TIME_TAG = 2
    private let FORECASTVIEW_IDENTIFIER: String = "Forecast"

    // Outlets
    @IBOutlet weak var locationPicker: UIPickerView! {
        didSet {
            locationPicker.tag = LOCATION_TAG
            
        }
    }
    @IBOutlet weak var timePicker: UIPickerView! {
        didSet {
            timePicker.tag = TIME_TAG
        }
    }
    @IBOutlet weak var locationLabel: UILabel! {
        didSet {
            locationLabel.addBorder(vBorders: [.Bottom], color: UIColor.lightGray, width: 1)
        }
    }
    @IBOutlet weak var timeLabel: UILabel! {
        didSet {
            timeLabel.addBorder(vBorders: [.Bottom], color: UIColor.lightGray, width: 1)
        }
    }
    @IBOutlet weak var forecastButton: UIButton! {
        didSet {
            forecastButton.isEnabled = true
        }
    }
    
    // Actions
    @IBAction func forecastAction(_ sender: Any) {
        if locationArray.count == 0 {
            getLocations()
        } else {
            locationSelected = locationArray[locationPicker.selectedRow(inComponent: 0)]
            timeSelected = timeArray[timePicker.selectedRow(inComponent: 0)]
            // Go to forecast view
            performSegue(withIdentifier: FORECASTVIEW_IDENTIFIER, sender: nil)
        }
    
    }
    
    // Declarations
    private var locationArray = [Location]()
    private let timeArray = AppConfig.getPredefinedTime()
    
    private var locationSelected: Location?
    private var timeSelected: Time?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        getLocations()
        
    }
    
    // Private functions
    private func getLocations() {
        RequestManager.fetch(url: ApiConfig.LOCATION_URL, parameters: ApiConfig.API_PARAMETER, completion: {
            [weak self] valueArray in
            guard let checkedSelf = self else {
                return
            }
            if let valueArray = valueArray {
                checkedSelf.locationArray = []
                for value in valueArray {
                    checkedSelf.locationArray.append(Location(value))
                }
                checkedSelf.locationArray = checkedSelf.locationArray.sorted { $0.name < $1.name }
                checkedSelf.locationPicker.reloadAllComponents()
                
                if checkedSelf.forecastButton.titleLabel?.text == "Reload" {
                    checkedSelf.forecastButton.setTitle("Forecast",for: .normal)
                }
            }
        })
      
    }
    
    
    // Overrides
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch (segue.identifier) {
        case FORECASTVIEW_IDENTIFIER:
            let next = segue.destination as! ForecastViewController
            next.locationBundled = locationSelected!
            next.timeBundled = timeSelected!
        default:
            break
        }
    }
    

}
// Extensions for Picker
extension RootViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        switch (pickerView.tag) {
        case LOCATION_TAG:
            if locationArray.count == 0 {
                return 1
            }
            return locationArray.count
        case TIME_TAG:
            return timeArray.count
        default:
            return 1
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        
        var pickerLabel = view as? UILabel;
        
        if pickerLabel == nil {
            pickerLabel = UILabel()
            
            pickerLabel?.font = UIFont(name: AppConfig.PICKER_FONT, size: AppConfig.PICKER_FONT_SIZE)
            pickerLabel?.textAlignment = NSTextAlignment.center
        }
        
        var text = ""
        switch pickerView.tag {
        case LOCATION_TAG:
            if locationArray.count == 0 {
                var gifImageView = view as? UIImageView;
                
                if gifImageView == nil {
                    gifImageView = UIImageView()
                    gifImageView?.contentMode = .center
                    gifImageView?.setGIFImage(name: AppConfig.PICKERLOADING_GIF)
                    forecastButton.setTitle("Reload", for: .normal)
                }
                
                return gifImageView!
            }
            text = locationArray[row].name
        case TIME_TAG:
            text = timeArray[row].name
        default:
            break
        }
        pickerLabel?.text = text
        
        return pickerLabel!
    }
    
    
  
    
}
