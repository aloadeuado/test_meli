// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let sales = try Sales(json)

import Foundation

// MARK: - Sales
struct Sales: Codable {
    var period: CancellationsPeriod?
    var completed: Int?
}

// MARK: Sales convenience initializers and mutators

extension Sales {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(Sales.self, from: data)
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
        period: CancellationsPeriod?? = nil,
        completed: Int?? = nil
    ) -> Sales {
        return Sales(
            period: period ?? self.period,
            completed: completed ?? self.completed
        )
    }

    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }

    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}
