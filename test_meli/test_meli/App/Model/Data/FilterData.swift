//
//  FilterData.swift
//  test_meli
//
//  Created by Invitado on 6/4/23.
//

import Foundation

class FilterData {
    var idTitle = ""
    var nameTitle = ""
    var idValue = ""
    var nameValue = ""
    var isTitle = false
    var state = false
    
    init(idTitle: String, nameTitle: String, idValue: String, nameValue: String, isTitle:Bool, state: Bool) {
        self.idTitle = idTitle
        self.nameTitle = nameTitle
        self.idValue = idValue
        self.nameValue = nameValue
        self.isTitle = isTitle
        self.state = state
    }
}
