//
//  Double+Extension.swift
//  test_meli
//
//  Created by Pedro Alonso Daza B on 4/06/23.
//

import Foundation
enum CurrencyCode: String {
    case usd = "USD"
    case eur = "EUR"
    case jpy = "JPY"
    case gbp = "GBP"
    // Añade aquí cualquier otro código de moneda que necesites
}

extension Double {
    func asCurrency(currencyCode: CurrencyCode) -> String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.currencyCode = currencyCode.rawValue
        return formatter.string(from: NSNumber(value: self)) ?? ""
    }
}
