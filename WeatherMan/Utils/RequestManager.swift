//
//  RequestManager.swift
//  WeatherMan
//
//  Created by Mark Joie Labios on 3/18/19.
//  Copyright © 2019 Mark Joie Labios. All rights reserved.
//

import Foundation
import Alamofire

class RequestManager {
    
    public static let NO_DATA_ERROR = "Error"
    
    static func isConnectedToInternet() -> Bool {
        return NetworkReachabilityManager()!.isReachable
    }
    
    static func fetch(url: String, parameters: [String:String], completion: @escaping ([[String: Any]]?) -> Void) {
        if isConnectedToInternet() {
            
            guard let url = URL(string: url) else {
                completion(nil)
                return
            }
            
            AF.request(url, method: .get, parameters: parameters).validate().responseJSON {
                response in
                //print(response.result.value)
                guard response.result.isSuccess else {
                    completion([["Error": NO_DATA_ERROR]])
                    return
                }
                
                guard let value = response.result.value as? [[String: Any]] else {
                    completion(nil)
                    return
                }
                
                    completion(value)
            }
        }
    }
}
