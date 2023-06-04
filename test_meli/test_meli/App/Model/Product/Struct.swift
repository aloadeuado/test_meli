// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let struct = try Struct(json)

import Foundation

// MARK: - Struct
struct Struct: Codable {
    var number: Double?
    var unit: Unit?
}

// MARK: Struct convenience initializers and mutators

extension Struct {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(Struct.self, from: data)
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
        number: Double?? = nil,
        unit: Unit?? = nil
    ) -> Struct {
        return Struct(
            number: number ?? self.number,
            unit: unit ?? self.unit
        )
    }

    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }

    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}
