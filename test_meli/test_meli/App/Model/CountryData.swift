//
//  CountryData.swift
//  test_meli
//
//  Created by Pedro Alonso Daza B on 1/06/23.
//

import Foundation

// MARK: - CountryData
struct CountryData: Codable {
    let id, name, locale, currencyID: String?
    var state = false
    enum CodingKeys: String, CodingKey {
        case id, name, locale
        case currencyID = "currency_id"
    }
    
    mutating func setState(state: Bool) {
        self.state = state
    }
}
