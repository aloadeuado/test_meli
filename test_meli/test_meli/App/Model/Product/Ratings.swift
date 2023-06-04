// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let ratings = try Ratings(json)

import Foundation

// MARK: - Ratings
struct Ratings: Codable {
    var negative, neutral, positive: Double?
}

// MARK: Ratings convenience initializers and mutators

extension Ratings {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(Ratings.self, from: data)
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
        negative: Double?? = nil,
        neutral: Double?? = nil,
        positive: Double?? = nil
    ) -> Ratings {
        return Ratings(
            negative: negative ?? self.negative,
            neutral: neutral ?? self.neutral,
            positive: positive ?? self.positive
        )
    }

    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }

    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}
