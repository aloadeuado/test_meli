// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let variationsDatum = try VariationsDatum(json)

import Foundation

// MARK: - VariationsDatum
struct VariationsDatum: Codable {
    var thumbnail: String?
    var ratio, name: String?
    var picturesQty: Int?
    var inventoryID: String?

    enum CodingKeys: String, CodingKey {
        case thumbnail, ratio, name
        case picturesQty = "pictures_qty"
        case inventoryID = "inventory_id"
    }
}

// MARK: VariationsDatum convenience initializers and mutators

extension VariationsDatum {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(VariationsDatum.self, from: data)
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
        thumbnail: String?? = nil,
        ratio: String?? = nil,
        name: String?? = nil,
        picturesQty: Int?? = nil,
        inventoryID: String?? = nil
    ) -> VariationsDatum {
        return VariationsDatum(
            thumbnail: thumbnail ?? self.thumbnail,
            ratio: ratio ?? self.ratio,
            name: name ?? self.name,
            picturesQty: picturesQty ?? self.picturesQty,
            inventoryID: inventoryID ?? self.inventoryID
        )
    }

    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }

    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}
