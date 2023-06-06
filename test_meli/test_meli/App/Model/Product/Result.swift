// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let result = try Result(json)

import Foundation

// MARK: - Result
class Result: Codable {
    var id, title: String?
    var permalink: String?
    var price: Double?
    var thumbnail: String?

    enum CodingKeys: String, CodingKey {
        case id
        case title, price, thumbnail, permalink
    }
    
    init(id: String, siteID: SiteID, title: String, price: Double, thumbnail: String, permalink: String) {
        self.id = id
        self.title = title
        self.price = price
        self.thumbnail = thumbnail
        self.permalink = permalink
    }
    
    init() {
        self.id = nil
        self.title = nil
        self.price = nil
        self.thumbnail = nil
        self.permalink = nil
    }
}
