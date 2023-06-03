//
//  String+Extension.swift
//  test_meli
//
//  Created by Pedro Alonso Daza B on 2/06/23.
//

import Foundation
extension String{
    
    var localized: String{
        return NSLocalizedString(self, tableName: nil, bundle: Bundle.main, value: "", comment: "")
    }
}
