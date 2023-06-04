//
//  CatagoriesRepository.swift
//  test_meli
//
//  Created by Invitado on 6/4/23.
//

import Foundation

struct CatagoriesRepository {
    static func getCategoriesOfSites(countryId: String, complete: @escaping ((Bool, [CategoryData]?, String?) -> Void )) {
        let url = getCategoriesOfCountry(countryId: countryId)
        
        ApiServices().requestHttpwithUrl(EpUrl: url, method: .get, withData: ["": ""], modelType: [CategoryData].self) { success, listCategoryData, err in
            DispatchQueue.main.async {
                if success {
                    complete(true, listCategoryData, nil)
                    return
                }
                complete(false, nil, err.debugDescription)
            }
        }
    }
}
