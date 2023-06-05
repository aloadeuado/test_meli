// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let address = try Address(json)

import Foundation

// MARK: - Address
struct Address: Codable {
    var stateID: StateID?
    var stateName: StateName?
    var cityID, cityName: String?

    enum CodingKeys: String, CodingKey {
        case stateID = "state_id"
        case stateName = "state_name"
        case cityID = "city_id"
        case cityName = "city_name"
    }
}

// MARK: Address convenience initializers and mutators

extension Address {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(Address.self, from: data)
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
        stateID: StateID?? = nil,
        stateName: StateName?? = nil,
        cityID: String?? = nil,
        cityName: String?? = nil
    ) -> Address {
        return Address(
            stateID: stateID ?? self.stateID,
            stateName: stateName ?? self.stateName,
            cityID: cityID ?? self.cityID,
            cityName: cityName ?? self.cityName
        )
    }

    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }

    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}
