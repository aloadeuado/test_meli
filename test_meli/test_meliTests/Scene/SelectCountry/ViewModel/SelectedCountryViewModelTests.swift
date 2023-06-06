//
//  SelectedCountryViewModelTests.swift
//  test_meliTests
//
//  Created by Pedro Alonso Daza B on 5/06/23.
//

import XCTest
@testable import test_meli
final class SelectedCountryViewModelTests: XCTestCase {

    func testGetFlagPngForCode() {
        // Creamos una instancia de SelectedContryViewModel
        let viewModel = SelectedContryViewModel(selectedContryDelegate: nil)
        
        // Creamos un mock de los datos
        let mockData = CountryFlagData(name: Name(common: "TestCountry", official: "official"), cca2: "CCA2", capital: ["Capital"], region: "Region", flags: Flags(png: "TestFlag"))
        viewModel.listCountryDetailData = [mockData] // Asegúrate de asignar un array a listCountryDetailData

        // Comprobamos que obtenemos la bandera correcta para el código de país dado
        let flag = viewModel.getFlagPngForCode(name: "TestCountry")
        XCTAssertEqual(flag, "TestFlag", "La bandera obtenida debería haber sido 'TestFlag'")
    }
    
    func testGetRegionForCode() {
        // Creamos una instancia de SelectedContryViewModel
        let viewModel = SelectedContryViewModel(selectedContryDelegate: nil)

        // Creamos un mock de los datos
        let mockData = CountryFlagData(name: Name(common: "TestCountry", official: "official"), cca2: "CCA2", capital: ["Capital"], region: "Region", flags: Flags(png: "TestFlag"))
        viewModel.listCountryDetailData = [mockData]

        // Comprobamos que obtenemos la región correcta para el código de país dado
        let region = viewModel.getRegionForCode(name: "TestCountry")
        XCTAssertEqual(region, "Region", "La región obtenida debería haber sido 'TestRegion'")
    }

}
