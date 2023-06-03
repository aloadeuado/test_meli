//
//  SelectedContryViewModel.swift
//  test_meli
//
//  Created by Pedro Alonso Daza B on 2/06/23.
//

import Foundation
class SelectedContryViewModel{
    var selectedContryDelegate: SelectedContryDelegate?
    var listCountryDetailData = [CountryFlagData]()
    
    init(selectedContryDelegate: SelectedContryDelegate?){
        self.selectedContryDelegate = selectedContryDelegate
    }
    
    func getCountries() {
        ContryRepository.getCountries { [weak self] success, countriesData, err in
            guard let self = self else {return}
            if success {
                if (countriesData ?? []).isEmpty {
                    self.selectedContryDelegate?.selectedContry(onNoData: "No data".localized)
                    return
                }
                if let countriesData = countriesData {
                    self.selectedContryDelegate?.selectedContry(succesComplete: countriesData)
                    return
                }
            }
            self.selectedContryDelegate?.selectedContry(onError: err ?? "")
        }
    }
    
    func getCountriesDetail() {
        ContryRepository.getDetailCountries { [weak self] success, listCountryFlagData, err in
            guard let self = self else {return}
            if success {
                if (listCountryFlagData ?? []).isEmpty {
                    self.selectedContryDelegate?.selectedContry(onNoData: "No data".localized)
                    return
                }
                if let listCountryFlagData = listCountryFlagData {
                    self.listCountryDetailData = listCountryFlagData
                    self.getCountries()
                    return
                }
            }
            self.selectedContryDelegate?.selectedContry(onError: err ?? "")
        }
    }

    func getFlagPngForCode(code: String) -> String {
        return self.listCountryDetailData.first { countryFlagData in
            return (countryFlagData.cca2 ?? "") == code
        }?.flags?.png ?? ""
    }
    
    func getRegionForCode(code: String) -> String {
        return self.listCountryDetailData.first { countryFlagData in
            return (countryFlagData.cca2 ?? "") == code
        }?.region ?? ""
    }
    
    func setInternalSite(countryData: CountryData) {
        ContryRepository.setInternalSite(countryData: countryData)
    }
    
    func setKeepSite(){
        setString(didSetString: "Save", key: "keyKeepSite")
    }
    
    func getKeepSite() -> String{
        return getString(didGetString: "keyKeepSite")
    }
}
protocol SelectedContryDelegate {
    func selectedContry(succesComplete listSites: [CountryData])
    func selectedContry(onNoData nodata:String)
    func selectedContry(onError error:String)
}
