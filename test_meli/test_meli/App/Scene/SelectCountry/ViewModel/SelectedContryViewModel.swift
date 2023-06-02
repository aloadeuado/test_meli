//
//  SelectedContryViewModel.swift
//  test_meli
//
//  Created by Pedro Alonso Daza B on 2/06/23.
//

import Foundation
class SelectedContryViewModel{
    var selectedContryDelegate: SelectedContryDelegate?
    
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
