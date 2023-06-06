//
//  SaleTermsTableViewCell.swift
//  test_meli
//
//  Created by Pedro Alonso Daza B on 5/06/23.
//

import UIKit

class SaleTermsTableViewCell: UITableViewCell {

    static let  identificador = "SaleTermsTableViewCell"
    static func nib() -> UINib  {   return UINib(nibName: "SaleTermsTableViewCell", bundle: Bundle(for: SaleTermsTableViewCell.self))  }
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var valueLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setData(saleTerm: SaleTerm) {
        nameLabel.text = saleTerm.name
        valueLabel.text = saleTerm.valueName
    }
    
}
