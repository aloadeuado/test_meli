//
//  ProductDetailData.swift
//  test_meli
//
//  Created by Pedro Alonso Daza B on 5/06/23.
//

import Foundation

// MARK: - ProductDetailDatum
struct ProductDetailData: Codable {
    let code: Int?
    let body: Body?
}

// MARK: - Body
struct Body: Codable {
    let id, siteID, title: String?
    let subtitle: String?
    let sellerID: Int?
    let categoryID: String?
    let price, basePrice: Double?
    let originalPrice: Double?
    let currencyID: String?
    let saleTerms: [SaleTerm]?
    let pictures: [Picture]?
    let attributes: [Attribute]?

    enum CodingKeys: String, CodingKey {
        case id
        case siteID = "site_id"
        case title, subtitle
        case sellerID = "seller_id"
        case categoryID = "category_id"
        case price
        case basePrice = "base_price"
        case originalPrice = "original_price"
        case currencyID = "currency_id"
        case saleTerms = "sale_terms"
        case pictures
        case attributes
    }
}

// MARK: - Location
struct Location: Codable {
}

// MARK: - Picture
struct Picture: Codable {
    let id: String?
    let url: String?
    let secureURL: String?
    let size, maxSize, quality: String?

    enum CodingKeys: String, CodingKey {
        case id, url
        case secureURL = "secure_url"
        case size
        case maxSize = "max_size"
        case quality
    }
}

// MARK: - SaleTerm
struct SaleTerm: Codable {
    let id, name: String?
    let valueName: String?

    enum CodingKeys: String, CodingKey {
        case id, name
        case valueName = "value_name"
    }
}

// MARK: - City
struct City: Codable {
    let id, name: String?
}

// MARK: - SearchLocation
struct SearchLocation: Codable {
    let city, state: City?
}
