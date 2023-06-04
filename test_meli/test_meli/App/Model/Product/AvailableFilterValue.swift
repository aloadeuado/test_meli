// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let availableFilterValue = try AvailableFilterValue(json)

import Foundation

// MARK: - AvailableFilterValue
struct AvailableFilterValue: Codable {
    var id, name: String?
    var results: Int?
}

// MARK: AvailableFilterValue convenience initializers and mutators

extension AvailableFilterValue {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(AvailableFilterValue.self, from: data)
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
        results: Int?? = nil
    ) -> AvailableFilterValue {
        return AvailableFilterValue(
            id: id ?? self.id,
            name: name ?? self.name,
            results: results ?? self.results
        )
    }

    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }

    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}
