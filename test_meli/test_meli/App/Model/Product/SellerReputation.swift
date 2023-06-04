// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let sellerReputation = try SellerReputation(json)

import Foundation

// MARK: - SellerReputation
struct SellerReputation: Codable {
    var levelID: LevelID?
    var powerSellerStatus: PowerSellerStatus?
    var transactions: Transactions?
    var metrics: Metrics?

    enum CodingKeys: String, CodingKey {
        case levelID = "level_id"
        case powerSellerStatus = "power_seller_status"
        case transactions, metrics
    }
}

// MARK: SellerReputation convenience initializers and mutators

extension SellerReputation {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(SellerReputation.self, from: data)
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
        levelID: LevelID?? = nil,
        powerSellerStatus: PowerSellerStatus?? = nil,
        transactions: Transactions?? = nil,
        metrics: Metrics?? = nil
    ) -> SellerReputation {
        return SellerReputation(
            levelID: levelID ?? self.levelID,
            powerSellerStatus: powerSellerStatus ?? self.powerSellerStatus,
            transactions: transactions ?? self.transactions,
            metrics: metrics ?? self.metrics
        )
    }

    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }

    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}
