// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let transactions = try Transactions(json)

import Foundation

// MARK: - Transactions
struct Transactions: Codable {
    var canceled, completed: Int?
    var period: TransactionsPeriod?
    var ratings: Ratings?
    var total: Int?
}

// MARK: Transactions convenience initializers and mutators

extension Transactions {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(Transactions.self, from: data)
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
        canceled: Int?? = nil,
        completed: Int?? = nil,
        period: TransactionsPeriod?? = nil,
        ratings: Ratings?? = nil,
        total: Int?? = nil
    ) -> Transactions {
        return Transactions(
            canceled: canceled ?? self.canceled,
            completed: completed ?? self.completed,
            period: period ?? self.period,
            ratings: ratings ?? self.ratings,
            total: total ?? self.total
        )
    }

    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }

    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}
