// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let sellerAddress = try SellerAddress(json)

import Foundation

// MARK: - SellerAddress
struct SellerAddress: Codable {
    var comment, addressLine: String?
    var id, latitude, longitude: JSONNull?
    var country, state, city: Sort?

    enum CodingKeys: String, CodingKey {
        case comment
        case addressLine = "address_line"
        case id, latitude, longitude, country, state, city
    }
}

// MARK: SellerAddress convenience initializers and mutators

extension SellerAddress {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(SellerAddress.self, from: data)
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
        comment: String?? = nil,
        addressLine: String?? = nil,
        id: JSONNull?? = nil,
        latitude: JSONNull?? = nil,
        longitude: JSONNull?? = nil,
        country: Sort?? = nil,
        state: Sort?? = nil,
        city: Sort?? = nil
    ) -> SellerAddress {
        return SellerAddress(
            comment: comment ?? self.comment,
            addressLine: addressLine ?? self.addressLine,
            id: id ?? self.id,
            latitude: latitude ?? self.latitude,
            longitude: longitude ?? self.longitude,
            country: country ?? self.country,
            state: state ?? self.state,
            city: city ?? self.city
        )
    }

    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }

    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}
