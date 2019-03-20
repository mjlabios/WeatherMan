//
//  ForecastViewController.swift
//  WeatherMan
//
//  Created by Mark Joie Labios on 19/03/2019.
//  Copyright © 2019 Mark Joie Labios. All rights reserved.
//

import Foundation
import UIKit

class ForecastViewController: UIViewController {
    
    // Constants
    private let FORECASTCELL_ID = "ForecastTableViewCell"
    private let WEBVIEW_IDENTIFIER = "WebView"
    
    // Outlets
    @IBOutlet weak var forecastTableView: UITableView!
    
    // Declarations
    var noForecastOverlay = NoForeCastOverlay()
    
    var timeBundled: Time?
    var locationBundled: Location?
    var forecastArray = [Forecast]()
    
    var urlSelected: String?
    var webViewTitle: String?

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        initialize()
        getForecasts()
        
    }
    
    private func initialize() {
        self.navigationItem.title = "\(locationBundled?.name ?? "") in \(timeBundled?.name ?? "" )"
        self.view.addSubview(noForecastOverlay)
    }
    
    // Private Functions
    private func getForecasts() {
        
        let time = timeBundled?.value ?? "1hour"
        let location = locationBundled?.key ?? "249758"

        let url = "\(ApiConfig.FORECAST_HOURLY_URL)\(time)/\(location)"
        
        RequestManager.fetch(url: url, parameters: ApiConfig.API_PARAMETER, completion: {
            [weak self] valueArray in
            guard let checkedSelf = self else {
                return
            }
            
            checkedSelf.forecastArray = [Forecast]()
            if let valueArray = valueArray {
                if valueArray.count == 1 && "\(valueArray[0]["Error"] ?? "")" == RequestManager.NO_DATA_ERROR {
                    checkedSelf.forecastTableView.isHidden = true
                    checkedSelf.noForecastOverlay.show()
                    checkedSelf.noForecastOverlay.stopLoading()
                
                } else {
                    checkedSelf.forecastTableView.isHidden = false
                    checkedSelf.noForecastOverlay.hide()
                }
                
                for forecast in valueArray {
                    checkedSelf.forecastArray.append(Forecast(forecast))
                }
                    checkedSelf.forecastTableView.reloadData()
                
            }
        })
        
        if forecastArray.count == 0 {
            forecastTableView.isHidden = true
            //noForecastOverlay.show()
        }
    }
    
}

// Extensions for TableView
extension ForecastViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if(forecastArray.count == 0) {
            noForecastOverlay.show()
            noForecastOverlay.load()
        }
        return forecastArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: FORECASTCELL_ID, for: indexPath) as! ForecastTableViewCell
        let forecast = forecastArray[indexPath.row]
        cell.iconPhraseLabel.text = forecast.iconPhrase
        cell.imageIcon.image = forecast.weatherImage
        cell.imageIcon.contentMode = .scaleAspectFit
        cell.temperatureLabel.text = forecast.temperature
        cell.timeLabel.text = forecast.dateTime
        cell.selectionStyle = .none
        
        if forecastArray.count != 0 {
        if indexPath.row % 2 == 0 {
            cell.contentView.backgroundColor = UIColor(hex: "D4EDE6")
        } else {
            cell.contentView.backgroundColor = UIColor(hex: "C7EDE6")
        }
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        urlSelected = forecastArray[indexPath.row].mobileLink
        let url: URL = URL(string: urlSelected!)!
        UIApplication.shared.open(url)
    }
    
    
}
