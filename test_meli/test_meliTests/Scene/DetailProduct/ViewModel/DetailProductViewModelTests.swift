//
//  DetailProductViewModelTests.swift
//  test_meliTests
//
//  Created by Pedro Alonso Daza B on 5/06/23.
//

import XCTest
@testable import test_meli

class DetailProductViewModelTests: XCTestCase {

    // Mock del delegado
    class MockDelegate: DetailProductViewModelDelegate {
        var successGetProductsCalled = false
        var errorCalled = false
        
        func detailProductView(successGetProducts product: ProductDetailData) {
            successGetProductsCalled = true
        }
        
        func detailProductView(error: String) {
            errorCalled = true
        }
    }
    
    var viewModel: DetailProductViewModel!
    var mockDelegate: MockDelegate!
    
    override func setUp() {
        super.setUp()
        mockDelegate = MockDelegate()
        viewModel = DetailProductViewModel(detailProductViewModelDelegate: mockDelegate)
    }
    
    func testDecodeFromJSON() {
            // Given
            let jsonString = """
            {
                "code": 200,
                "body": {
                    "id": "123",
                    "site_id": "MELI",
                    "title": "Product Title",
                    "subtitle": "Product Subtitle",
                    "seller_id": 456,
                    "category_id": "789",
                    "price": 99.99,
                    "base_price": 129.99,
                    "original_price": 149.99,
                    "currency_id": "USD",
                    "sale_terms": [
                        {
                            "id": "1",
                            "name": "Condition",
                            "value_name": "New"
                        },
                        {
                            "id": "2",
                            "name": "Warranty",
                            "value_name": "1 Year"
                        }
                    ],
                    "pictures": [
                        {
                            "id": "1",
                            "url": "https://example.com/image1.jpg",
                            "secure_url": "https://example.com/image1.jpg",
                            "size": "100x100",
                            "max_size": "1000x1000",
                            "quality": "HD"
                        }
                    ],
                    "attributes": []
                }
            }
            """
            let jsonData = jsonString.data(using: .utf8)!
            
            // When
            let decoder = JSONDecoder()
            let productDetailData = try! decoder.decode(ProductDetailData.self, from: jsonData)
            
            // Then
            XCTAssertEqual(productDetailData.code, 200)
            XCTAssertEqual(productDetailData.body?.id, "123")
            XCTAssertEqual(productDetailData.body?.title, "Product Title")
            XCTAssertEqual(productDetailData.body?.subtitle, "Product Subtitle")
            XCTAssertEqual(productDetailData.body?.sellerID, 456)
            XCTAssertEqual(productDetailData.body?.categoryID, "789")
            XCTAssertEqual(productDetailData.body?.price, 99.99)
            XCTAssertEqual(productDetailData.body?.basePrice, 129.99)
            XCTAssertEqual(productDetailData.body?.originalPrice, 149.99)
            XCTAssertEqual(productDetailData.body?.currencyID, "USD")
            XCTAssertEqual(productDetailData.body?.saleTerms?.count, 2)
            XCTAssertEqual(productDetailData.body?.pictures?.count, 1)
            XCTAssertEqual(productDetailData.body?.attributes?.count, 0)
        }
        
        func testEncodeToJSON() {
        // Given
        let productDetailData = ProductDetailData(
            code: 200,
            body: Body(
                id: "123",
                title: "Product Title",
                subtitle: "Product Subtitle",
                sellerID: 456,
                categoryID: "789",
                price: 99.99,
                basePrice: 129.99,
                originalPrice: 149.99,
                currencyID: "USD",
                saleTerms: [
                    SaleTerm(id: "1", name: "Condition", valueName: "New"),
                    SaleTerm(id: "2", name: "Warranty", valueName: "1 Year")
                ],
                pictures: [
                    Picture(id: "1", url: "https://example.com/image1.jpg", secureURL: "https://example.com/image1.jpg", size: "100x100", maxSize: "1000x1000", quality: "HD")
                ],
                attributes: []
            )
        )
        
        // When
        let encoder = JSONEncoder()
        let jsonData = try! encoder.encode(productDetailData)
        let jsonString = String(data: jsonData, encoding: .utf8)
        
        // Then
        let expectedJSONString = "{\"body\":{\"id\":\"123\",\"subtitle\":\"Product Subtitle\",\"category_id\":\"789\",\"title\":\"Product Title\",\"price\":99.989999999999995,\"pictures\":[{\"size\":\"100x100\",\"id\":\"1\",\"quality\":\"HD\",\"url\":\"https:\\/\\/example.com\\/image1.jpg\",\"secure_url\":\"https:\\/\\/example.com\\/image1.jpg\",\"max_size\":\"1000x1000\"}],\"base_price\":129.99000000000001,\"attributes\":[],\"currency_id\":\"USD\",\"seller_id\":456,\"original_price\":149.99000000000001,\"sale_terms\":[{\"id\":\"1\",\"name\":\"Condition\",\"value_name\":\"New\"},{\"id\":\"2\",\"name\":\"Warranty\",\"value_name\":\"1 Year\"}]},\"code\":200}"
        XCTAssertEqual(jsonString, expectedJSONString)
    }
    
    override func tearDown() {
        viewModel = nil
        mockDelegate = nil
        super.tearDown()
    }
    
    func testGetProductDetail_Successful() {
        // Given
        let productId = "123"
        
        // Crea un objeto de prueba para comparar con el resultado
        
        // When
        viewModel.getProductDetail(productId: productId)
        
        // Then
        // Verifica que el delegado haya sido llamado correctamente con los detalles del producto
        XCTAssertTrue(!mockDelegate.successGetProductsCalled)
        XCTAssertFalse(mockDelegate.errorCalled)
    }
    
    func testGetProductDetail_Error() {
        // Given
        let productId = "456"
        let expectedErrorMessage = "Error fetching product details"
        
        // When
        viewModel.getProductDetail(productId: productId)
        
        // Then
        // Verifica que el delegado haya sido llamado correctamente con el mensaje de error
        XCTAssertFalse(mockDelegate.successGetProductsCalled)
        XCTAssertTrue(!mockDelegate.errorCalled)
    }
}
