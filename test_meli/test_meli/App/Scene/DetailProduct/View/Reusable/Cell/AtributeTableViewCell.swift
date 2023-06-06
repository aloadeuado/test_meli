//
//  AtributeTableViewCell.swift
//  test_meli
//
//  Created by Pedro Alonso Daza B on 5/06/23.
//

import UIKit

class AtributeTableViewCell: UITableViewCell {
    
    static let  identificador = "AtributeTableViewCell"
    static func nib() -> UINib  {   return UINib(nibName: "AtributeTableViewCell", bundle: Bundle(for: AtributeTableViewCell.self))  }
    
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
    
    func setData(attribute: Attribute, indexPath: IndexPath) {
        nameLabel.text = "    " + (attribute.name ?? "")
        valueLabel.text = "    " + (attribute.valueName ?? "")
        if (indexPath.row % 2) == 0 {
            nameLabel.backgroundColor = #colorLiteral(red: 0.9215685725, green: 0.9215685725, blue: 0.9215685725, alpha: 1)
            valueLabel.backgroundColor = #colorLiteral(red: 0.9607843757, green: 0.9607843757, blue: 0.9607843757, alpha: 1)
            return
        }
        nameLabel.backgroundColor = #colorLiteral(red: 0.9607843757, green: 0.9607843757, blue: 0.9607843757, alpha: 1)
        valueLabel.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        return
    }
    
}
