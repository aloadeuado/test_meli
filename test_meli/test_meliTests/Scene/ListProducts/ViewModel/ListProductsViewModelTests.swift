//
//  ListProductsViewModelTests.swift
//  test_meliTests
//
//  Created by Pedro Alonso Daza B on 5/06/23.
//

import XCTest
@testable import test_meli

class ListProductsViewModelTests: XCTestCase {

    var listProductsViewModel: ListProductsViewModel!
    var delegate: MockDelegate!
    
    override func setUp() {
        super.setUp()
        delegate = MockDelegate()
        listProductsViewModel = ListProductsViewModel(listProductsViewModelDelegate: delegate)
    }

    func testGetListTextSortInternal() {
        let productData = ProductData() // Assuming ProductData is a class or struct
        // Set up productData with necessary data

        let result = listProductsViewModel.getListTextSortInternal(productData: productData)
        // Compare the result with your expected outcome
    }
    
    func testSetInitOffsetAndLimit() {
        let productData = ProductData() // Assuming ProductData is a class or struct
        // Set up productData with necessary data

        let result = listProductsViewModel.setInitOffsetAndLimit(numberOfItems: 10, productData: productData)
        // Compare the result with your expected outcome
    }
    
    func testSetSortValue() {
        let productData = ProductData() // Assuming ProductData is a class or struct
        // Set up productData with necessary data

        let result = listProductsViewModel.setSortValue(nameSort: "TestSort", productData: productData)
        // Compare the result with your expected outcome
    }

    // Continue for each function in your ViewModel
}

// Mock Delegate
class MockDelegate: ListProductsViewModelDelegate {

    func listProductsViewModel(succesGetCategories categories: [CategoryData]) {
        // Implement for test if needed
    }

    func listProductsViewModel(succesGetSite siteModel: CountryData) {
        // Implement for test if needed
    }

    func listProductsViewModel(onError error: String) {
        // Implement for test if needed
    }

    func listProductsViewModel(succesGetProduct products: ProductData) {
        // Implement for test if needed
    }
}
