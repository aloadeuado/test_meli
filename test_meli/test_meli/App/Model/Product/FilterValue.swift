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

// MARK: FilterValue convenience initializers and mutators

extension FilterValue {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(FilterValue.self, from: data)
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
        id: String?? = nil,
        name: String?? = nil,
        pathFromRoot: [Sort]?? = nil
    ) -> FilterValue {
        return FilterValue(
            id: id ?? self.id,
            name: name ?? self.name,
            pathFromRoot: pathFromRoot ?? self.pathFromRoot
        )
    }

    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }

    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}
