// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let attribute = try Attribute(json)

import Foundation

// MARK: - Attribute
struct Attribute: Codable {
    var id, name: String?
    var valueID, valueName: String?
    var attributeGroupID: AttributeGroupID?
    var attributeGroupName: AttributeGroupName?
    var valueStruct: Struct?
    var values: [AttributeValue]?
    var source: Int?
    var valueType: ValueType?

    enum CodingKeys: String, CodingKey {
        case id, name
        case valueID = "value_id"
        case valueName = "value_name"
        case attributeGroupID = "attribute_group_id"
        case attributeGroupName = "attribute_group_name"
        case valueStruct = "value_struct"
        case values, source
        case valueType = "value_type"
    }
}

// MARK: Attribute convenience initializers and mutators

extension Attribute {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(Attribute.self, from: data)
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
        valueID: String?? = nil,
        valueName: String?? = nil,
        attributeGroupID: AttributeGroupID?? = nil,
        attributeGroupName: AttributeGroupName?? = nil,
        valueStruct: Struct?? = nil,
        values: [AttributeValue]?? = nil,
        source: Int?? = nil,
        valueType: ValueType?? = nil
    ) -> Attribute {
        return Attribute(
            id: id ?? self.id,
            name: name ?? self.name,
            valueID: valueID ?? self.valueID,
            valueName: valueName ?? self.valueName,
            attributeGroupID: attributeGroupID ?? self.attributeGroupID,
            attributeGroupName: attributeGroupName ?? self.attributeGroupName,
            valueStruct: valueStruct ?? self.valueStruct,
            values: values ?? self.values,
            source: source ?? self.source,
            valueType: valueType ?? self.valueType
        )
    }

    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }

    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}
