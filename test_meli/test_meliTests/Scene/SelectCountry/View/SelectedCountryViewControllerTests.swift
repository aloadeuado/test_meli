//
//  SelectedCountryViewControllerTests.swift
//  test_meliTests
//
//  Created by Pedro Alonso Daza B on 5/06/23.
//

import XCTest
@testable import test_meli
final class SelectedCountryViewControllerTests: XCTestCase {

    // Declara un ViewController para probar
        var viewController: SelectedContryViewController!

        override func setUp() {
            super.setUp()

            // Inicializa el ViewController antes de cada prueba
            let storyboard = UIStoryboard(name: "SelectCountry", bundle: nil) // Asegúrate de usar el nombre correcto de tu storyboard
            viewController = storyboard.instantiateViewController(withIdentifier: "SelectedContryViewController") as? SelectedContryViewController

            // Llama a viewDidLoad()
            viewController.loadViewIfNeeded()

            // Configura el ViewModel
            // Aquí es donde podrías configurar un ViewModel de prueba en lugar del real
            viewController.selectedContryViewModel = SelectedContryViewModel(selectedContryDelegate: viewController)

            // Configura los datos iniciales
            viewController.listCountryData = [CountryData(state: false), CountryData(state: false)]
        }

        func testSelectedSite() {
            // Selecciona el primer sitio
            viewController.selectedSite(indexPath: IndexPath(row: 0, section: 0))

            // Asegúrate de que el primer sitio esté seleccionado
            XCTAssertTrue(viewController.listCountryData[0].state, "El primer sitio debe estar seleccionado")

            // Asegúrate de que el segundo sitio no esté seleccionado
            XCTAssertFalse(viewController.listCountryData[1].state, "El segundo sitio no debe estar seleccionado")
        }

}
