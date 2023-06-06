//
//  CountryData.swift
//  test_meli
//
//  Created by Pedro Alonso Daza B on 1/06/23.
//

import Foundation

// MARK: - CountryData
struct CountryData: Codable {
    var id: String? = ""
    var name: String? = ""
    var default_currency_id: String? = ""
    
    var state = false
    
    enum CodingKeys: String, CodingKey {
        case id, name, default_currency_id
    }
    
    mutating func setState(state: Bool) {
        self.state = state
    }
}
