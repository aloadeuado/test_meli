// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let productData = try ProductData(json)

import Foundation

// MARK: - ProductData
class ProductData: Codable {
    var countryDefaultTimeZone: String?
    var paging: Paging?
    var results: [Result]?
    var sort: Sort?
    var availableSorts: [Sort]?
    var filters: [Filter]?
    var availableFilters: [AvailableFilter]?

    enum CodingKeys: String, CodingKey {
        case countryDefaultTimeZone = "country_default_time_zone"
        case paging, results, sort
        case availableSorts = "available_sorts"
        case filters
        case availableFilters = "available_filters"
    }
    
    init() {
        self.countryDefaultTimeZone = nil
        self.paging = nil
        self.results = nil
        self.sort = nil
        self.availableSorts = nil
        self.filters = nil
        self.availableFilters = nil
    }
}
