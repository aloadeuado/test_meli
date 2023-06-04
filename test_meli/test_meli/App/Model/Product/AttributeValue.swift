// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let attributeValue = try AttributeValue(json)

import Foundation

// MARK: - AttributeValue
struct AttributeValue: Codable {
    var id, name: String?
    var valueStruct: Struct?
    var source: Int?

    enum CodingKeys: String, CodingKey {
        case id, name
        case valueStruct = "struct"
        case source
    }
}

// MARK: AttributeValue convenience initializers and mutators

extension AttributeValue {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(AttributeValue.self, from: data)
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
        id: String?? = nil,
        name: String?? = nil,
        valueStruct: Struct?? = nil,
        source: Int?? = nil
    ) -> AttributeValue {
        return AttributeValue(
            id: id ?? self.id,
            name: name ?? self.name,
            valueStruct: valueStruct ?? self.valueStruct,
            source: source ?? self.source
        )
    }

    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }

    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}
