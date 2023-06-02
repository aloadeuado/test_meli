//
//  RouteURL.swift
//  test_meli
//
//  Created by Pedro Alonso Daza B on 1/06/23.
//

import Foundation

func getStringOfInfo(key:String) -> String{
    
    if let value = Bundle.main.object(forInfoDictionaryKey: key) {
        if let stringValue = value as? String {
            return stringValue
        }
    }
    
    return ""
     
}

func getCountriesRoute() -> String {
    return getStringOfInfo(key: "API_BASE_URL") + "/classified_locations/countries"
}
