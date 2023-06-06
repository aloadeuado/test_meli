//
//  CarouselImageCollectionViewCell.swift
//  test_meli
//
//  Created by Pedro Alonso Daza B on 5/06/23.
//

import UIKit
import SDWebImage
class CarouselImageCollectionViewCell: UICollectionViewCell {

    static let  identificador = "CarouselImageCollectionViewCell"
    static func nib() -> UINib  {   return UINib(nibName: "CarouselImageCollectionViewCell", bundle: Bundle(for: CarouselImageCollectionViewCell.self))  }
    
    @IBOutlet weak var photoImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func setData(urlImage: String) {
        if let url = URL(string: urlImage) {
            photoImageView.sd_setImage(with: url)
        }
    }

}
