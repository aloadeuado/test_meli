//
//  ContryRepository.swift
//  test_meli
//
//  Created by Pedro Alonso Daza B on 2/06/23.
//

import Foundation

struct ContryRepository {
    static func getCountries(complete: @escaping ((Bool, [CountryData]?, String?) -> Void )) {
        let url = getCountriesRoute()
        
        ApiServices().requestHttpwithUrl(EpUrl: url, method: .get, withData: ["": ""], modelType: [CountryData].self) { success, countryData, err in
            DispatchQueue.main.async {
                if success {
                    complete(true, countryData, nil)
                    return
                }
                complete(false, nil, err.debugDescription)
            }
        }
    }
    
    static func getDetailCountries(complete: @escaping ((Bool, [CountryFlagData]?, String?) -> Void )) {
        let url = getDetailCountriesRoute()
        ApiServices().requestHttpwithUrl(EpUrl: url, method: .get, withData: ["": ""], modelType: [CountryFlagData].self) { success, countryData, err in
            DispatchQueue.main.async {
                if success {
                    complete(true, countryData, nil)
                    return
                }
                complete(false, nil, err.debugDescription)
            }
        }
    }
    
    static func setInternalSite(countryData: CountryData) {
        
        if let encoded = try? JSONEncoder().encode(countryData) {
            setData(didSetData: encoded, key: "keyCountry")
        }
        
    }
    
    static func getInternalSite() -> (countryData: CountryData?, error: String) {
        let data = getData(didGetData: "keyCountry")
            let countryData = try? JSONDecoder().decode(CountryData.self, from: data)
            if let countryData1 = countryData {
                return (countryData: countryData1, error: "")
            }else {
                return (nil, "No Data".localized)
            }
    }
}
