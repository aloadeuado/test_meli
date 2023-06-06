// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let installments = try Installments(json)

import Foundation

// MARK: - Installments
struct Installments: Codable {
    var quantity: Int?
    var amount: Double?
    var rate: Int?
    var currencyID: CurrencyID?

    enum CodingKeys: String, CodingKey {
        case quantity, amount, rate
        case currencyID = "currency_id"
    }
}

// MARK: Installments convenience initializers and mutators

extension Installments {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(Installments.self, from: data)
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
        quantity: Int?? = nil,
        amount: Double?? = nil,
        rate: Int?? = nil,
        currencyID: CurrencyID?? = nil
    ) -> Installments {
        return Installments(
            quantity: quantity ?? self.quantity,
            amount: amount ?? self.amount,
            rate: rate ?? self.rate,
            currencyID: currencyID ?? self.currencyID
        )
    }

    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }

    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}
