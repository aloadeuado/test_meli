// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let paging = try Paging(json)

import Foundation

// MARK: - Paging
class Paging: Codable {
    var total, primaryResults, offset, limit: Int?

    enum CodingKeys: String, CodingKey {
        case total
        case primaryResults = "primary_results"
        case offset, limit
    }
    
    init(total: Int?, primaryResults: Int?, offset: Int?, limit: Int?) {
        self.total = total
        self.primaryResults = primaryResults
        self.offset = offset
        self.limit = limit
    }
    
    init() {
        self.total = nil
        self.primaryResults = nil
        self.offset = nil
        self.limit = nil
    }
}
