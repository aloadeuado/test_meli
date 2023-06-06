//
//  ViewController.swift
//  test_meli
//
//  Created by Pedro Alonso Daza B on 1/06/23.
//

import UIKit
import Toast_Swift
class SelectedContryViewController: UIViewController {


    @IBOutlet weak var sitesTableView: UITableView!
    @IBOutlet weak var continueButton: CustomEnabledButton!
    
    @IBOutlet weak var noDataView: UIView!
    
    var isLoadingSites = false
    var selectedContryViewModel: SelectedContryViewModel?
    
    var listCountryData = [CountryData]()
    var countryData: CountryData?
    override func viewDidLoad() {
        super.viewDidLoad()
        initComponent()
        // Do any additional setup after loading the view.
    }
    
    func initComponent(){
        sitesTableView.register(SelectedContryTableViewCell.nib(), forCellReuseIdentifier: SelectedContryTableViewCell.identificador)
        noDataView.isHidden = true
        selectedContryViewModel = SelectedContryViewModel(selectedContryDelegate: self)
        if selectedContryViewModel?.getKeepSite() == "Save" {
            ListProductsViewController.navigationShow(controller: self, countryData: self.countryData ?? CountryData())
        }
        isLoadingSites = true
        //selectedContryViewModel?.getCountriesDetail()
        selectedContryViewModel?.getCountries()
        setStateButton()
    }
    
    func selectedSite(indexPath: IndexPath){
        var i = 0
        let listSitesModelReference = listCountryData
        var list = [CountryData]()
        for site in listSitesModelReference {
            var site1 =  site
            if indexPath.row == i {
                site1.setState(state: true)
                countryData = site1
            } else {
                site1.setState(state: false)
            }
            list.append(site1)
            i += 1
        }
        listCountryData = list
        setStateButton()
        sitesTableView.reloadData()
    }
    
    func setStateButton(){
        let listChecks = listCountryData.first(where: { (siteModel) -> Bool in return siteModel.state })
        continueButton.setEnabled(state: ((listChecks?.state) != nil))
    }


}
//MARK: -Actions
extension SelectedContryViewController {
    @IBAction func continuePressed(button: UIButton) {
        if let siteModel1 = countryData{
            AlerMessageThreeOptionsViewController.show(controller: self, textMessagge: "You have already selected a site. What do you want to do with this decision?".localized) {
                self.selectedContryViewModel?.setKeepSite()
                self.selectedContryViewModel?.setInternalSite(countryData: siteModel1)
                ListProductsViewController.navigationShow(controller: self, countryData: self.countryData ?? CountryData())
            } option2: {
                self.selectedContryViewModel?.setInternalSite(countryData: siteModel1)
                ListProductsViewController.navigationShow(controller: self, countryData: self.countryData ?? CountryData())
            } option3: {
                
            }
        }
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        /*if let controller = segue.destination as? ListProductsViewController {
            controller.siteModel = siteModel ?? SiteModel()
        }*/
    }
}
//MARK: -UITableViewDelegate
extension SelectedContryViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedSite(indexPath: indexPath)
    }
}

//MARK: -UITableViewDataSource
extension SelectedContryViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (isLoadingSites) ? 3 : listCountryData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: SelectedContryTableViewCell.identificador) as? SelectedContryTableViewCell else {
            return UITableViewCell()
        }
        cell.delegate = self
        if (isLoadingSites) {
            cell.showSpinner()
        } else {
            
            cell.stopSpinner()
            cell.setData(countryData: listCountryData[indexPath.row], region: selectedContryViewModel?.getRegionForCode(name: listCountryData[indexPath.row].name ?? "") ?? "", flagUrl: selectedContryViewModel?.getFlagPngForCode(name: listCountryData[indexPath.row].name ?? "") ?? "", indexPath: indexPath)
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    
}
//MARK: -SelectedContryTableViewCellDelegate
extension SelectedContryViewController: SelectedContryTableViewCellDelegate{
    func selectedContryTableViewCell(didSelectSwitch state: Bool, indexPath: IndexPath) {
        selectedSite(indexPath: indexPath)
    }
    
    
}
//MARK: -SelectedContryDelegate
extension SelectedContryViewController: SelectedContryDelegate {
    
    func selectedContry(succesComplete listCountryData: [CountryData]) {
        isLoadingSites = false
        self.listCountryData = listCountryData
        sitesTableView.reloadData()
    }
    
    func selectedContry(onNoData nodata: String) {
        isLoadingSites = false
        self.view.makeToast(nodata)
    }
    
    func selectedContry(onError error: String) {
        isLoadingSites = false
        noDataView.isHidden = false
        self.view.makeToast(error)
    }

}

