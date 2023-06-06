//
//  DetailProductViewControllerTests.swift
//  test_meliTests
//
//  Created by Pedro Alonso Daza B on 5/06/23.
//

import XCTest
@testable import test_meli

class DetailProductViewControllerTests: XCTestCase {

    var viewController: DetailProductViewController!
    var viewModel: MockDetailProductViewModel!

    override func setUp() {
        super.setUp()
        
        viewController = DetailProductViewController(nibName: "DetailProductViewController", bundle: nil)
        viewModel = MockDetailProductViewModel(detailProductViewModelDelegate: viewController)
        viewController.detailProductViewModel = viewModel
        
        let product = Result() // Set with relevant data
        viewController.result = product
        viewController.loadViewIfNeeded()
    }
    
    override func tearDown() {
        viewController = nil
        viewModel = nil
        
        super.tearDown()
    }
    
    func testInitComponent() {
        viewController.initComponent()
        XCTAssertTrue(!viewModel.getProductDetailCalled)
    }

    // Add more tests here
}

class MockDetailProductViewModel: DetailProductViewModel {
    
    var expectation: XCTestExpectation?
    var getProductDetailCalled = false

    override func getProductDetail(productId: String) {
        getProductDetailCalled = true
        expectation?.fulfill()
    }
    
    // override more functions here...
}
