// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let seller = try Seller(json)

import Foundation

// MARK: - Seller
struct Seller: Codable {
    var id: Int?
    var nickname: String?
    var carDealer, realEstateAgency, empty: Bool?
    var registrationDate: String?
    var tags: [SellerTag]?
    var carDealerLogo: String?
    var permalink: String?
    var sellerReputation: SellerReputation?
    var eshop: Eshop?

    enum CodingKeys: String, CodingKey {
        case id, nickname
        case carDealer = "car_dealer"
        case realEstateAgency = "real_estate_agency"
        case empty = "_"
        case registrationDate = "registration_date"
        case tags
        case carDealerLogo = "car_dealer_logo"
        case permalink
        case sellerReputation = "seller_reputation"
        case eshop
    }
}

// MARK: Seller convenience initializers and mutators

extension Seller {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(Seller.self, from: data)
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
        id: Int?? = nil,
        nickname: String?? = nil,
        carDealer: Bool?? = nil,
        realEstateAgency: Bool?? = nil,
        empty: Bool?? = nil,
        registrationDate: String?? = nil,
        tags: [SellerTag]?? = nil,
        carDealerLogo: String?? = nil,
        permalink: String?? = nil,
        sellerReputation: SellerReputation?? = nil,
        eshop: Eshop?? = nil
    ) -> Seller {
        return Seller(
            id: id ?? self.id,
            nickname: nickname ?? self.nickname,
            carDealer: carDealer ?? self.carDealer,
            realEstateAgency: realEstateAgency ?? self.realEstateAgency,
            empty: empty ?? self.empty,
            registrationDate: registrationDate ?? self.registrationDate,
            tags: tags ?? self.tags,
            carDealerLogo: carDealerLogo ?? self.carDealerLogo,
            permalink: permalink ?? self.permalink,
            sellerReputation: sellerReputation ?? self.sellerReputation,
            eshop: eshop ?? self.eshop
        )
    }

    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }

    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}
