// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let availableFilter = try AvailableFilter(json)

import Foundation

// MARK: - AvailableFilter
struct AvailableFilter: Codable {
    var id, name, type: String?
    var values: [AvailableFilterValue]?
}

// MARK: AvailableFilter convenience initializers and mutators

extension AvailableFilter {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(AvailableFilter.self, from: data)
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
        type: String?? = nil,
        values: [AvailableFilterValue]?? = nil
    ) -> AvailableFilter {
        return AvailableFilter(
            id: id ?? self.id,
            name: name ?? self.name,
            type: type ?? self.type,
            values: values ?? self.values
        )
    }

    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }

    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}
