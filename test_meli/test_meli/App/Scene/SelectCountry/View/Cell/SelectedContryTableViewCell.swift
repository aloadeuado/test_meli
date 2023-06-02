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
    @IBOutlet weak var region: UILabel!
    @IBOutlet weak var flagWebView: WKWebView!
    @IBOutlet weak var stateSwicth: UISwitch!
    
    var delegate: SelectedContryTableViewCellDelegate?
    
    var countryData: CountryData?
    var indexPath = IndexPath(row: 0, section: 0)
    func setData(countryData: CountryData, indexPath: IndexPath) {
        self.indexPath = indexPath
        self.countryData = countryData
        titleLabel.text = "Name: ".localized + (countryData.name ?? "")
        stateSwicth.isOn = countryData.state
        
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
/*//MARK: -SelectedContryDelegate
extension SelectedContryTableViewCell: SelectedContryDelegate {
    func selectedContry(succesCompleteDetail siteDetail: SiteDetailModel) {
        flagImageView.sd_setImage(with: URL(string: siteDetail.flag))
        region.text = TextConstants().LABEL_REGION + siteDetail.region

        if let url = URL(string: siteDetail.flag) {
            let request = NSURLRequest(url: url )
            flagWebView.load(request as URLRequest)
        }
        
    }
    
    func selectedContry(succesComplete listSites: [SiteModel]) {
        
    }
    
    func selectedContry(onNoData nodata: String) {
        
    }
    
    func selectedContry(onError error: String) {
        
    }
}*/
//MARK: -SelectedContryTableViewCellDelegate
protocol SelectedContryTableViewCellDelegate {
    func selectedContryTableViewCell(didSelectSwitch state: Bool, indexPath: IndexPath)
}
