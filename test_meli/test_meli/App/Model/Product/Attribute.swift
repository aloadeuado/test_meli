// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let attribute = try Attribute(json)

import Foundation

// MARK: - Attribute
struct Attribute: Codable {
    var id, name: String?
    var valueName: String?

    enum CodingKeys: String, CodingKey {
        case id, name
        case valueName = "value_name"
    }
}
