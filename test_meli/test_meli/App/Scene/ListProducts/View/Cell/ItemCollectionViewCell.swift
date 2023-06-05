//
//  ItemCollectionViewCell.swift
//  test_meli
//
//  Created by Pedro Alonso Daza B on 4/06/23.
//

import UIKit
import SDWebImage
import ABLoaderView

class ItemCollectionViewCell: UICollectionViewCell {

    static let  identificador = "ItemCollectionViewCell"
    static func nib() -> UINib  {   return UINib(nibName: "ItemCollectionViewCell", bundle: Bundle(for: ItemCollectionViewCell.self))  }
    
    @IBOutlet weak var generalView: CustomView!
    @IBOutlet weak var itemImageView: UIImageView!
    @IBOutlet weak var itemTitleLabel: UILabel!
    @IBOutlet weak var priceTitleLabel: UILabel!
    
    func setValue(result: Result) {

        if let url = URL(string: result.thumbnail ?? ""){
            itemImageView.sd_setImage(with: url) { image, err, imageCacheType, url in
                if let error = err {
                    print(error.localizedDescription)
                }
            }
        }
        itemTitleLabel.text = result.title
        priceTitleLabel.text = (result.price ?? 0).asCurrency(currencyCode: .usd)
    }
    
    func showSpinner(){
        generalView.subviews.forEach { (view) in
            ABLoader().startShining(view)
        }
    }
    
    func stopSpinner() {
        generalView.subviews.forEach { (view) in
            ABLoader().stopShining(view)
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
