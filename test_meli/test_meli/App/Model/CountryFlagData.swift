//
//  CountryFlagData.swift
//  test_meli
//
//  Created by Pedro Alonso Daza B on 2/06/23.
//
import Foundation
// MARK: - CountryFlagData
struct CountryFlagData: Codable {
    let name: Name?
    let cca2: String?
    let capital: [String]?
    let region: String?
    let flags: Flags?
}

// MARK: - Flags
struct Flags: Codable {
    let png: String?
}

// MARK: - Name
struct Name: Codable {
    let common, official: String?
}
