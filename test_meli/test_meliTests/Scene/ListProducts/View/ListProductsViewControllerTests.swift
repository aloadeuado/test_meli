//
//  ListProductsViewControllerTests.swift
//  test_meliTests
//
//  Created by Pedro Alonso Daza B on 5/06/23.
//

import XCTest
@testable import test_meli

class ListProductsViewControllerTests: XCTestCase {

    var viewController: ListProductsViewController!
    var viewModel: MockListProductsViewModel!

    override func setUp() {
        super.setUp()
        // Inicializa el ViewController antes de cada prueba
        //let storyboard = UIStoryboard(name: "Main", bundle: nil) // Asegúrate de usar el nombre correcto de tu storyboard
        viewController = ListProductsViewController(nibName: "SelectedContryViewController", bundle: nil)
        
        viewModel = MockListProductsViewModel(listProductsViewModelDelegate: viewController)
    }
    
    override func tearDown() {
        viewController = nil
        viewModel = nil
        
        super.tearDown()
    }
    
    func testGetProducts() {
        let expectation = self.expectation(description: "Get products")
        viewModel.expectation = expectation
        viewModel.getProducts(countryId: "MLA", textSearch: "iphone")
        wait(for: [expectation], timeout: 5.0)
        XCTAssertTrue(viewModel.getProductsCalled)
    }

    func testGetCategories() {
        let expectation = self.expectation(description: "Get categories")
        viewModel.expectation = expectation
        viewModel.getCategoriesOfSites(countryId: "MLA")
        wait(for: [expectation], timeout: 5.0)
        XCTAssertTrue(viewModel.getCategoriesOfSitesCalled)
    }
    
}

class MockListProductsViewModel: ListProductsViewModel {
    
    var expectation: XCTestExpectation?
    var getProductsCalled = false
    var getCategoriesOfSitesCalled = false
    
    override func getProducts(countryId: String, textSearch: String) {
        getProductsCalled = true
        expectation?.fulfill()
    }

    override func getCategoriesOfSites(countryId: String) {
        getCategoriesOfSitesCalled = true
        expectation?.fulfill()
    }
    
    // ...override more functions here...
}
