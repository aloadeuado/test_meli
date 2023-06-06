//
//  DetailProductViewController.swift
//  test_meli
//
//  Created by Pedro Alonso Daza B on 5/06/23.
//

import UIKit
import Toast_Swift
import ABLoaderView

class DetailProductViewController: UIViewController {

    @IBOutlet weak var itemCarouselImageView: CarouselImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var noDataView: UIView!
    @IBOutlet weak var saleTermsAndAttributesTableView: UITableView!
    @IBOutlet weak var heightSaleTermsAndAttributesTableViewLayout: NSLayoutConstraint!
    
    var result = Result()
    var product: ProductDetailData?
    var detailProductViewModel: DetailProductViewModel?
    override func viewDidLoad() {
        super.viewDidLoad()
        initComponent()
        // Do any additional setup after loading the view.
    }
    

    func initComponent(){
        saleTermsAndAttributesTableView.register(SaleTermsTableViewCell.nib(), forCellReuseIdentifier: SaleTermsTableViewCell.identificador)
        saleTermsAndAttributesTableView.register(AtributeTableViewCell.nib(), forCellReuseIdentifier: AtributeTableViewCell.identificador)
        detailProductViewModel = DetailProductViewModel(detailProductViewModelDelegate: self)
        detailProductViewModel?.getProductDetail(productId: result.id ?? "")
        itemCarouselImageView.delegate = self
        titleLabel.text = result.title
        if let priceComplete = result.price {
            priceLabel.text = priceComplete.asCurrency(currencyCode: .usd)
        }
    }
    
    func setHeightTableView() {
        heightSaleTermsAndAttributesTableViewLayout.constant = CGFloat(((product?.body?.saleTerms?.count ?? 0) + (product?.body?.attributes?.count ?? 0) ) * 60)
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
//MARK: -CarouselImageViewDelegate
extension DetailProductViewController: CarouselImageViewDelegate {
    func carouselImageViewDelegate(selectIndex index: Int, urlImage: String) {
        DialogZoomImageViewController.show(controller: self, urlImage: urlImage)
    }
}
//MARK: -DetailProductViewModelDelegate
extension DetailProductViewController: DetailProductViewModelDelegate {
    func detailProductView(successGetProducts product: ProductDetailData) {
        self.product = product
        noDataView.isHidden = true
        let listProductData: [String] = self.product?.body?.pictures.map({ picture in
            return picture.map { picture in
                return picture.url ?? ""
            }
        }) ?? []
        itemCarouselImageView.setData(controller: self, listUrlsImage: listProductData)
        saleTermsAndAttributesTableView.reloadData()
        setHeightTableView()
    }
    
    func detailProductView(error: String) {
        noDataView.isHidden = false
        self.view.makeToast(error)
    }

}
//MARK: -UITableViewDataSource
extension DetailProductViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return (product?.body?.saleTerms?.count ?? 0)
        }
        return (product?.body?.attributes?.count ?? 0)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section <= 0 {
            if let cell = tableView.dequeueReusableCell(withIdentifier: SaleTermsTableViewCell.identificador, for: indexPath) as? SaleTermsTableViewCell{
                if let product = self.product, let body = product.body, let saleTerms = body.saleTerms {
                    cell.setData(saleTerm: saleTerms[indexPath.row])
                }
                return cell
            }
        }
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: AtributeTableViewCell.identificador, for: indexPath) as? AtributeTableViewCell{
            if let product = self.product, let body = product.body, let attributes = body.attributes {
                cell.setData(attribute: attributes[indexPath.row], indexPath: indexPath)
            }
            return cell
        }
        
        return UITableViewCell()
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 0 {
            return "Terms of sale".localized
        }
        return "Product attributes".localized
    }
}
