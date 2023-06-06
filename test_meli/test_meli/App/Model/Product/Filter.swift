// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let filter = try Filter(json)

import Foundation

// MARK: - Filter
class Filter: Codable {
    var id, name, type: String?
    var values: [FilterValue]?
    
    init(id: String, name: String, type: String, values: [FilterValue]) {
        self.id = id
        self.name = name
        self.type = type
        self.values = values
    }
}
