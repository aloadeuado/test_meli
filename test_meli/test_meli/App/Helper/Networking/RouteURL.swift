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
    return getStringOfInfo(key: "API_BASE_URL") + "sites"
}

func getDetailCountriesRoute() -> String {
    return getStringOfInfo(key: "API_BASE_URL_DETAIL") + "v3.1/all"
}

func getCategoriesOfCountry(countryId: String) -> String {
    return getStringOfInfo(key: "API_BASE_URL") + "/sites/\(countryId)/categories"
}

func getItemsOfCategoryRoute(countryId: String, categoryId: String) -> String {
    return getStringOfInfo(key: "API_BASE_URL") + "/sites/\(countryId)/search?category=\(categoryId)"
}

func getItemsOfSearchTextRoute(countryId: String, text: String) -> String {
    return getStringOfInfo(key: "API_BASE_URL") + "/sites/\(countryId)/search?q=\(text)"
}
