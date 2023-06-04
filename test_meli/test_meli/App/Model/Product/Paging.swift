// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let paging = try Paging(json)

import Foundation

// MARK: - Paging
struct Paging: Codable {
    var total, primaryResults, offset, limit: Int?

    enum CodingKeys: String, CodingKey {
        case total
        case primaryResults = "primary_results"
        case offset, limit
    }
}

// MARK: Paging convenience initializers and mutators

extension Paging {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(Paging.self, from: data)
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
        total: Int?? = nil,
        primaryResults: Int?? = nil,
        offset: Int?? = nil,
        limit: Int?? = nil
    ) -> Paging {
        return Paging(
            total: total ?? self.total,
            primaryResults: primaryResults ?? self.primaryResults,
            offset: offset ?? self.offset,
            limit: limit ?? self.limit
        )
    }

    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }

    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}
