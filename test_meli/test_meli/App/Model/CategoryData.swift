//
//  CategoryModel.swift
//  test_meli
//
//  Created by Pedro Alonso Daza B on 3/06/23.
//

import Foundation
struct CategoryData: Codable {
    var id : String = ""
    var name : String = ""

    init(id: String, name: String) {
        self.id = id
        self.name = name
    }
    
    enum CodingKeys: String, CodingKey {

        case id = "id"
        case name = "name"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try values.decodeIfPresent(String.self, forKey: .id) ?? ""
        name = try values.decodeIfPresent(String.self, forKey: .name) ?? ""
    }
}
