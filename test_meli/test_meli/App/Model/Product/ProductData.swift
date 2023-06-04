// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let productData = try ProductData(json)

import Foundation

// MARK: - ProductData
class ProductData: Codable {
    var siteID: SiteID?
    var countryDefaultTimeZone: String?
    var paging: Paging?
    var results: [Result]?
    var sort: Sort?
    var availableSorts: [Sort]?
    var filters: [Filter]?
    var availableFilters: [AvailableFilter]?

    enum CodingKeys: String, CodingKey {
        case siteID = "site_id"
        case countryDefaultTimeZone = "country_default_time_zone"
        case paging, results, sort
        case availableSorts = "available_sorts"
        case filters
        case availableFilters = "available_filters"
    }
}

// MARK: ProductData convenience initializers and mutators

extension ProductData {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(ProductData.self, from: data)
    }

    init(_ json: String, using encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else {
            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
        }
        try self.init(data: data)
    }

    init(fromURL url: URL) throws {
        try self.init(data: try Data(contentsOf: url))
    }

    func with(
        siteID: SiteID?? = nil,
        countryDefaultTimeZone: String?? = nil,
        paging: Paging?? = nil,
        results: [Result]?? = nil,
        sort: Sort?? = nil,
        availableSorts: [Sort]?? = nil,
        filters: [Filter]?? = nil,
        availableFilters: [AvailableFilter]?? = nil
    ) -> ProductData {
        return ProductData(
            siteID: siteID ?? self.siteID,
            countryDefaultTimeZone: countryDefaultTimeZone ?? self.countryDefaultTimeZone,
            paging: paging ?? self.paging,
            results: results ?? self.results,
            sort: sort ?? self.sort,
            availableSorts: availableSorts ?? self.availableSorts,
            filters: filters ?? self.filters,
            availableFilters: availableFilters ?? self.availableFilters
        )
    }

    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }

    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}
