//
//  ProductRepository.swift
//  test_meli
//
//  Created by Pedro Alonso Daza B on 3/06/23.
//

import Foundation
struct ProductRepository {
    static func getProducts(countryCode: String, productData: ProductData, complete: @escaping ((Bool, ProductData?, String?) -> Void )) {
        let url = getProductsRouter(countryId: countryCode, productData: productData)
        
        ApiServices().requestHttpwithUrl(EpUrl: url, method: .get, withData: ["": ""], modelType: ProductData.self) { success, productData, err in
            DispatchQueue.main.async {
                if success {
                    complete(true, productData, nil)
                    return
                }
                complete(false, nil, err.debugDescription)
            }
        }
    }
    
    static func getProducts(countryCode: String, textSearch: String, complete: @escaping ((Bool, ProductData?, String?) -> Void )){
        let url = getItemsOfSearchTextRoute(countryId: countryCode, text: textSearch)

        ApiServices().requestHttpwithUrl(EpUrl: url, method: .get, withData: ["": ""], modelType: ProductData.self) { success, productData, err in
            DispatchQueue.main.async {
                if success {
                    complete(true, productData, nil)
                    return
                }
                complete(false, nil, err.debugDescription)
            }
        }

    }
    
    static func getProductDetail(productId: String, complete: @escaping ((Bool, [ProductDetailData]?, String?) -> Void )){
        let url = getProductDetailRoute(productId: productId)

        ApiServices().requestHttpwithUrl(EpUrl: url, method: .get, withData: ["": ""], modelType: [ProductDetailData].self) { success, productDetailData, err in
            DispatchQueue.main.async {
                if success {
                    complete(true, productDetailData, nil)
                    return
                }
                complete(false, nil, err.debugDescription)
            }
        }

    }
}
