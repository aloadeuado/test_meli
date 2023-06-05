// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let metrics = try Metrics(json)

import Foundation

// MARK: - Metrics
struct Metrics: Codable {
    var sales: Sales?
    var claims, delayedHandlingTime, cancellations: Cancellations?

    enum CodingKeys: String, CodingKey {
        case sales, claims
        case delayedHandlingTime = "delayed_handling_time"
        case cancellations
    }
}

// MARK: Metrics convenience initializers and mutators

extension Metrics {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(Metrics.self, from: data)
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
        sales: Sales?? = nil,
        claims: Cancellations?? = nil,
        delayedHandlingTime: Cancellations?? = nil,
        cancellations: Cancellations?? = nil
    ) -> Metrics {
        return Metrics(
            sales: sales ?? self.sales,
            claims: claims ?? self.claims,
            delayedHandlingTime: delayedHandlingTime ?? self.delayedHandlingTime,
            cancellations: cancellations ?? self.cancellations
        )
    }

    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }

    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}
