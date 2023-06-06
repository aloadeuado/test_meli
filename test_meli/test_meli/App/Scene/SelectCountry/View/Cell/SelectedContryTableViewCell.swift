//
//  SelectedContryTableViewCell.swift
//  test_meli
//
//  Created by Pedro Alonso Daza B on 1/06/23.
//

import UIKit
import SDWebImage
import WebKit
import ABLoaderView

class SelectedContryTableViewCell: UITableViewCell {
    
    static let  identificador = "SelectedContryTableViewCell"
    static func nib() -> UINib  {   return UINib(nibName: "SelectedContryTableViewCell", bundle: Bundle(for: SelectedContryTableViewCell.self))  }
    
    @IBOutlet weak var contentViewShimmer: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var regionLabel: UILabel!
    @IBOutlet weak var flagImageView: UIImageView!
    @IBOutlet weak var stateSwicth: UISwitch!
    
    var delegate: SelectedContryTableViewCellDelegate?
    
    var countryData: CountryData?
    var indexPath = IndexPath(row: 0, section: 0)
    func setData(countryData: CountryData, region: String, flagUrl: String, indexPath: IndexPath) {
        self.indexPath = indexPath
        self.countryData = countryData
        titleLabel.text = "Name: ".localized + (countryData.name ?? "")
        stateSwicth.isOn = countryData.state
        
        ContryRepository.getDetailCountry(name: (countryData.name ?? "").lowercased()) { [weak self] success, countryFlagData, err in
            guard let self = self else {return}
            if success {
                if let countryFlagData = countryFlagData, !countryFlagData.isEmpty {
                    if let url = URL(string: countryFlagData[0].flags?.png ?? "") {
                        self.flagImageView.sd_setImage(with: url)
                    }
                    self.regionLabel.text = countryFlagData[0].region ?? ""
                }
            }
        }
        
    }
    
    func showSpinner() {

            for view1 in contentViewShimmer.subviews {
                 ABLoader().startShining(view1)
             }
         
     }
    
    func stopSpinner() {

            for view1 in contentViewShimmer.subviews {
                ABLoader().stopShining(view1)
            }

           
       }
    
   
}
//MARK: -Actions
extension SelectedContryTableViewCell {
    @IBAction func stateChange(_ sender: UISwitch) {
        delegate?.selectedContryTableViewCell(didSelectSwitch: sender.isOn, indexPath: indexPath)
    }
}
//MARK: -SelectedContryTableViewCellDelegate
protocol SelectedContryTableViewCellDelegate {
    func selectedContryTableViewCell(didSelectSwitch state: Bool, indexPath: IndexPath)
}
