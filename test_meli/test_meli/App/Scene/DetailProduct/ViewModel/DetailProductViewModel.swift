//
//  DetailProductViewModel.swift
//  test_meli
//
//  Created by Pedro Alonso Daza B on 5/06/23.
//

import Foundation
protocol DetailProductViewModelDelegate: AnyObject {
    func detailProductView(successGetProducts product: ProductDetailData)
    func detailProductView(error: String)
}
class DetailProductViewModel {
    var detailProductViewModelDelegate: DetailProductViewModelDelegate?
    
    init(detailProductViewModelDelegate: DetailProductViewModelDelegate?) {
        self.detailProductViewModelDelegate = detailProductViewModelDelegate
    }
    
    func getProductDetail(productId: String) {
        ProductRepository.getProductDetail(productId: productId) { [weak self] success, listProductDetailData, err in
            guard let self = self else {return}
            if success {
                if let listProductDetailData = listProductDetailData {
                    if !listProductDetailData.isEmpty{
                        self.detailProductViewModelDelegate?.detailProductView(successGetProducts: listProductDetailData[0])
                    }
                    return
                }
            }
            self.detailProductViewModelDelegate?.detailProductView(error: err ?? "No data".localized)
        }
    }
}
