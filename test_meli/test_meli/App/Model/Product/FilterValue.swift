// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let filterValue = try FilterValue(json)

import Foundation

// MARK: - FilterValue
class FilterValue: Codable {
    var id, name: String?
    var pathFromRoot: [Sort]?

    enum CodingKeys: String, CodingKey {
        case id, name
        case pathFromRoot = "path_from_root"
    }
    
    init(id: String, name: String) {
        self.id = id
        self.name = name
        //self.pathFromRoot = pathFromRoot
    }
}
