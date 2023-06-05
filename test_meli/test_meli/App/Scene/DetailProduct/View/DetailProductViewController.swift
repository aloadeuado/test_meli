//
//  DetailProductViewController.swift
//  test_meli
//
//  Created by Pedro Alonso Daza B on 5/06/23.
//

import UIKit

class DetailProductViewController: UIViewController {

    @IBOutlet weak var itemImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    
    var result = Result()
    override func viewDidLoad() {
        super.viewDidLoad()
        initComponent()
        // Do any additional setup after loading the view.
    }
    

    func initComponent(){
        titleLabel.text = result.title
        if let priceComplete = result.price {
            priceLabel.text = "$ \(priceComplete)"
        }
        if let url = URL(string: result.thumbnail ?? ""){
            itemImageView.sd_setImage(with: url)
        }
    }

}
//MARK: -Actions
extension DetailProductViewController {
    @IBAction func showMorePressed(button: UIButton) {
        DialogWebViewViewController.show(controller: self, titleText: result.title ?? "", url: result.permalink ?? "")
    }
}
//MARK: -Show
extension DetailProductViewController {
    static func navigationShow(controller: UIViewController, result: Result) {
        let detailProductViewController = DetailProductViewController(nibName: "DetailProductViewController", bundle: nil)
        detailProductViewController.result = result
        controller.navigationController?.pushViewController(detailProductViewController, animated: true)
    }
}
