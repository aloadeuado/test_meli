// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let eshop = try Eshop(json)

import Foundation

// MARK: - Eshop
struct Eshop: Codable {
    var eshopID, seller: Int?
    var nickName: String?
    var eshopStatusID: Int?
    var siteID: SiteID?
    var eshopExperience: Int?
    var eshopRubro: JSONNull?
    var eshopLocations: [JSONAny]?
    var eshopLogoURL: String?

    enum CodingKeys: String, CodingKey {
        case eshopID = "eshop_id"
        case seller
        case nickName = "nick_name"
        case eshopStatusID = "eshop_status_id"
        case siteID = "site_id"
        case eshopExperience = "eshop_experience"
        case eshopRubro = "eshop_rubro"
        case eshopLocations = "eshop_locations"
        case eshopLogoURL = "eshop_logo_url"
    }
}

// MARK: Eshop convenience initializers and mutators

extension Eshop {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(Eshop.self, from: data)
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
        eshopID: Int?? = nil,
        seller: Int?? = nil,
        nickName: String?? = nil,
        eshopStatusID: Int?? = nil,
        siteID: SiteID?? = nil,
        eshopExperience: Int?? = nil,
        eshopRubro: JSONNull?? = nil,
        eshopLocations: [JSONAny]?? = nil,
        eshopLogoURL: String?? = nil
    ) -> Eshop {
        return Eshop(
            eshopID: eshopID ?? self.eshopID,
            seller: seller ?? self.seller,
            nickName: nickName ?? self.nickName,
            eshopStatusID: eshopStatusID ?? self.eshopStatusID,
            siteID: siteID ?? self.siteID,
            eshopExperience: eshopExperience ?? self.eshopExperience,
            eshopRubro: eshopRubro ?? self.eshopRubro,
            eshopLocations: eshopLocations ?? self.eshopLocations,
            eshopLogoURL: eshopLogoURL ?? self.eshopLogoURL
        )
    }

    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }

    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}
