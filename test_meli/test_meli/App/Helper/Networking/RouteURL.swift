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

func getProductsRouter(countryId: String, productData: ProductData) -> String {
    var url = getStringOfInfo(key: "API_BASE_URL") + "/sites/\(countryId)/search?"
    url += "limit=\(productData.paging?.limit ?? 0)"
    url += "&offset=\(productData.paging?.offset ?? 0)"
    url += (productData.sort?.id == "") ? "" : "&sort=\(productData.sort?.id ?? "")"
    productData.filters?.forEach { (filter) in
        let idFilter = filter.id
        filter.values?.forEach { (filterValue) in
            url += "&\(idFilter ?? "")=\(filterValue.id ?? "")"
        }
    }
    if let urlString = url.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) {
        url = urlString
    }
    
    return url
}
