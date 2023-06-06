# Test Meli
La aplicaicon es un test app para meli donde se listan productos a partir de un pais seleccionado y ver detalles interesantes del producto. se compone de tres pantallas
- seleccion de pais
- lista de productos
- detalle de producto


## Manejo de git (git flow)
- se trabaja con 2 ramas principales develop y main desde develop se desprenden ramas por cada feature del proyecto 

![firebasestorage](https://firebasestorage.googleapis.com/v0/b/testmeli-e8ffc.appspot.com/o/Captura%20de%20pantalla%202023-06-05%20a%20la(s)%209.42.51%20p.m..png?alt=media&token=58107ee8-e360-4c99-b60b-84927b62069e&_gl=1*qgfynw*_ga*NjIzMzk4NzExLjE2ODI4NzIxNjU.*_ga_CW55HF8NVT*MTY4NjAxODg1NS44LjEuMTY4NjAxOTQyNi4wLjAuMA..)

- tambien se emula el merge de ramas por medio de pull request
- example

![firebasestorage](https://firebasestorage.googleapis.com/v0/b/testmeli-e8ffc.appspot.com/o/Captura%20de%20pantalla%202023-06-05%20a%20la(s)%207.03.24%20p.m..png?alt=media&token=385d0660-9246-4790-b746-a0de2acad262&_gl=1*1wfjmtf*_ga*NjIzMzk4NzExLjE2ODI4NzIxNjU.*_ga_CW55HF8NVT*MTY4NjAxODg1NS44LjEuMTY4NjAyMDEzNS4wLjAuMA..)

## Manejo de hambientes

- se crea flujo especificos para 3 posibles mabientes dev, qa, prd y asi mismo se crean los schems 

![firebasestorage](https://firebasestorage.googleapis.com/v0/b/testmeli-e8ffc.appspot.com/o/Captura%20de%20pantalla%202023-06-05%20a%20la(s)%209.33.36%20p.m..png?alt=media&token=5e18d8be-3b40-448c-a2cf-2eda67713a08&_gl=1*yvhw83*_ga*NjIzMzk4NzExLjE2ODI4NzIxNjU.*_ga_CW55HF8NVT*MTY4NjAxODg1NS44LjEuMTY4NjAxODk5MS4wLjAuMA..)

- con [.xconfig](https://nshipster.com/xcconfig/) especifico por hambiente 

![firebasestorage](https://firebasestorage.googleapis.com/v0/b/testmeli-e8ffc.appspot.com/o/Captura%20de%20pantalla%202023-06-05%20a%20la(s)%209.39.17%20p.m..png?alt=media&token=6943b35a-aba6-42d0-9203-9c0d9dcef6e3&_gl=1*okye7w*_ga*NjIzMzk4NzExLjE2ODI4NzIxNjU.*_ga_CW55HF8NVT*MTY4NjAxODg1NS44LjEuMTY4NjAxOTE4Mi4wLjAuMA..)

- adcional es posible que las aplicaicones convivan en el mismo dispositivo por hambiente 

![firebasestorage](https://firebasestorage.googleapis.com/v0/b/testmeli-e8ffc.appspot.com/o/Captura%20de%20pantalla%202023-06-05%20a%20la(s)%209.09.35%20p.m..png?alt=media&token=ef3d95b9-e21d-4c03-a82d-30f8c7305231&_gl=1*hzeiba*_ga*NjIzMzk4NzExLjE2ODI4NzIxNjU.*_ga_CW55HF8NVT*MTY4NjAxODg1NS44LjEuMTY4NjAxOTkyNC4wLjAuMA..)

- esto es posible por el cambio por xcofig de cada scheme

![firebasestorage](https://firebasestorage.googleapis.com/v0/b/testmeli-e8ffc.appspot.com/o/Captura%20de%20pantalla%202023-06-05%20a%20la(s)%209.53.34%20p.m..png?alt=media&token=8ea0e1e8-0daa-4d58-998d-e10569c26903&_gl=1*1a3jgil*_ga*NjIzMzk4NzExLjE2ODI4NzIxNjU.*_ga_CW55HF8NVT*MTY4NjAxODg1NS44LjEuMTY4NjAyMDAzNi4wLjAuMA..)


## Installation

Use cocoa pods [cocoapods](https://cocoapods.org/) he instala los pods de dependencias .

```bash
pod install
```

## Dependencias Usadas

```javascript
# Uncomment the next line to define a global platform for your project
# platform :ios, '9.0'

target 'test_meli' do
  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!

  pod 'SDWebImage', '~> 5.0'
  pod 'ABLoaderView', '~> 1.0.2'
  pod 'Toast-Swift', '~> 5.0.1'
  pod 'ImageScrollView', '~> 1.9.3'
  # Pods for test_meli

  target 'test_meliTests' do
    inherit! :search_paths
    # Pods for testing
  end

  target 'test_meliUITests' do
    # Pods for testing
  end

end

```
- nota: contempla el uso de algunos pods
- SDWebImage: descargar imagenes y menejo de cache para su reconsumo posteriormente.
- ABLoaderView: para la evidencia de fragmento de desgradado mientras trae los datos o responde en EndPoint seleccionado.
- ImageScrollView: hacer zoom a las imagenes cargadas y verlas a detalle


## Arquitectura usada
- mvvm: la idea es la implementación de [POP](https://medium.com/globallogic-latinoamerica-mobile/la-programaci%C3%B3n-orientada-a-protocolos-en-swift-3548ed2dc2f1) conjunto con un viewModel con los protocolos
```swift
protocol ListProductsViewModelDelegate: AnyObject {
    func listProductsViewModel(succesGetCategories categories: [CategoryData])
    func listProductsViewModel(succesGetSite siteModel: CountryData)
    func listProductsViewModel(onError error: String)
    func listProductsViewModel(succesGetProduct products: ProductData)
}

```
- y por medio de binding se entregar los resuelto en los servicios para las vistas

```swift
//MARK: -ListProductsViewModel
extension ListProductsViewController: ListProductsViewModelDelegate {
    func listProductsViewModel(succesGetSite countryData: CountryData) {
        self.countryData = countryData
    }
    
    func listProductsViewModel(succesGetProduct products: ProductData) {
        stopSpinner()
        var productsNewsResult = self.products.results ?? [Result]()
        productsNewsResult.append(contentsOf: products.results ?? [Result]())
        self.products = products
        self.products.results = productsNewsResult
        if self.products.results?.isEmpty ?? false {
            noDataView.isHidden = false
            hideTools()
            return
        }
        noDataView.isHidden = true
        showTools()
        sortSelectOptionView.arrayList = listProductsViewModel?.getListTextSortInternal(productData: self.products) ?? [String]()
        listCategoriesFilters = listProductsViewModel?.getFiltersAvaible(productData: self.products) ?? [FilterData]()
        productCollectionView.setContentOffset(CGPoint(x: 0, y: lastContentSizeHeight), animated: false)
        isLoadingProdcuts = false
        productCollectionView.reloadData()
        
    }
    
    func listProductsViewModel(succesGetCategories categories: [CategoryData]) {
        filterCategoryView.stopSpinner()
        self.categories = categories
        var listTextCategories = [String]()
        categories.forEach { (categoryModel) in
            listTextCategories.append(categoryModel.name)
        }
        filterCategoryView.setCategoryFilter(categoryTextArray: listTextCategories)
        
    }
    
    func listProductsViewModel(onError error: String) {
        stopSpinner()
        noDataView.isHidden = false
        isLoadingProdcuts = false
        products = productsBefore
        productCollectionView.reloadData()
        self.view.makeToast(error)
    }
    
    
}

```
- se agrego una arquitectura repository para el manejo de storage
- una clase de trato de data dependiendo de la necesidad del negocio
```swift
import Foundation
import UIKit

class ApiServices {
    enum Method : String {
        case post = "POST"
        case put = "PUT"
        case get = "GET"
        case patch = "PATCH"
    }
    
    func requestHttpwithUrl<T : Codable>(EpUrl: String, method: ApiServices.Method, withData parameters: [String:Any], modelType:T.Type, completionHandler: @escaping (Bool, T?, Error?) -> Void) {
        
        let request_url = URL(string: EpUrl)
        
        let request:NSMutableURLRequest = NSMutableURLRequest()
        print("[URL REQUEST=>]: \(request_url)")
        print("[PARAMETERS=>]: \(parameters)")
        request.url = request_url
        request.httpMethod = method.rawValue
        request.timeoutInterval = 30
        request.allHTTPHeaderFields = ["Content-Type": "application/json"]
        if method != .get {
            let postData = try? JSONSerialization.data(withJSONObject: parameters, options: [])
            request.httpBody = postData
        }
        let session = URLSession.init(configuration: .default)
        let task = session.dataTask(with: request as URLRequest, completionHandler: { (data, response, error) -> Void in
            let response = (response as? HTTPURLResponse)
            print("[CODE STATUS=>]: \(response)")
            if response?.statusCode == 200 {
                if let safeData = data {
                    let decoder = JSONDecoder()
                    do {
                        let textJson = String(decoding: safeData, as: UTF8.self)
                        print("[RESPONSE=>]: \(textJson)")
                        let decodedData = try decoder.decode(modelType, from: safeData)
                        DispatchQueue.main.async {
                            completionHandler(true, decodedData, nil)
                        }
                    } catch let error{
                        print(error.localizedDescription)
                        DispatchQueue.main.async {
                            completionHandler(false, nil, error)
                        }
                    }
                }else{
                    print("[ERROR=>]: \(error?.localizedDescription ?? "")")
                    DispatchQueue.main.async {
                        completionHandler(false, nil, error)
                    }
                }
            }else{
                print("[ERROR=>]: \(error?.localizedDescription ?? "")")
                if let safeData = data{
                    let textJson = String(decoding: safeData, as: UTF8.self)
                    print("[RESPONSE=>]: \(textJson)")
                    let decoder = JSONDecoder()
                    DispatchQueue.main.async {
                        completionHandler(false, nil, nil)
                    }
                }else{
                    completionHandler(false, nil, nil)
                }
            }
        })
        task.resume()
    }
}

```

- y una etapa de encapsulamiento mas dedicada al negocio
```swift
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

```
- y por medio del viewModel nos comunicamos con las vista.

```swift
import Foundation
class ListProductsViewModel{
    
    var listProductsViewModelDelegate: ListProductsViewModelDelegate?

    init(listProductsViewModelDelegate: ListProductsViewModelDelegate) {
        self.listProductsViewModelDelegate = listProductsViewModelDelegate
    }
    func setCatogoryProduct(nameCategory: String, categoryModel: CategoryData, productData: ProductData) -> ProductData {
        guard let categoryFilterAvaible = productData.availableFilters?.first(where: { (availableFilter) -> Bool in
            return availableFilter.id == "category"
        }) else {
            let filterValue = FilterValue(id: categoryModel.id, name: categoryModel.name)
            let filterr = Filter(id: "category", name: "", type: "", values: [filterValue])
            productData.filters = [filterr]
            return productData
        }
        
        guard let valueAvaible = categoryFilterAvaible.values?.first(where: { (availableFilterValue) -> Bool in
            availableFilterValue.name == nameCategory
        }) else {
            let filterValue = FilterValue(id: categoryModel.id, name: categoryModel.name)
            let filterr = Filter(id: "category", name: "", type: "", values: [filterValue])
            productData.filters = [filterr]
            return productData
        }
        
        guard let categoryFilter = productData.filters?.first(where: { (filter) -> Bool in
            return filter.id == "category"
        }) else { return productData }
        categoryFilter.values = [FilterValue(id: valueAvaible.id ?? "", name: valueAvaible.name ?? "")]
        productData.filters = [categoryFilter]
        
        return productData
    }
    
    func getListTextSortInternal(productData: ProductData) -> [String] {
        var listTextSort = [String] ()
        listTextSort.append(productData.sort?.name ?? "")
        productData.availableSorts?.forEach { (sort) in
            listTextSort.append(sort.name ?? "")
        }
        
        return listTextSort
    }
    
    func setInitOffsetAndLimit(numberOfItems: Int32, productData:ProductData) -> ProductData {
        productData.paging = Paging(total: 0, primaryResults: 0, offset: 0, limit: Int(numberOfItems))
        productData.paging?.offset = 0
        productData.paging?.limit = Int(numberOfItems)
        
        return productData
    }
    
    func setSortValue(nameSort: String, productData: ProductData) -> ProductData {
        guard let sordSend = productData.availableSorts?.first(where: { (sort) -> Bool in
            return sort.name == nameSort
        }) else {
            return productData
        }
        
        productData.sort = sordSend
        
        return productData
    }
    
    func getFiltersAvaible(productData: ProductData) -> [FilterData] {
        var listFilter = [FilterData]()
        productData.filters?.forEach({ filter in
            let idTitle = filter.id ?? ""
            let nameTitle = filter.name ?? ""
            listFilter.append(FilterData(idTitle: idTitle, nameTitle: nameTitle, idValue: "", nameValue: "", isTitle: true, state: false))
            let listInternalFilter = filter.values?.map({ filterValue in
                let idValue = filterValue.id ?? ""
                let nameValue = filterValue.name ?? ""
                return FilterData(idTitle: idTitle, nameTitle: nameTitle, idValue: idValue, nameValue: nameValue, isTitle: false, state: true)
            })
            listFilter.append(contentsOf: listInternalFilter ?? [])
            if let availableFilterInternal = productData.availableFilters?.first(where: { availableFilter in
                return availableFilter.id == idTitle
            }) {
                let listAvailableFilterValue = availableFilterInternal.values?.map({ availableFilterValue in
                    let idValue = availableFilterValue.id ?? ""
                    let nameValue = availableFilterValue.name ?? ""
                    return FilterData(idTitle: idTitle, nameTitle: nameTitle, idValue: idValue, nameValue: nameValue, isTitle: false, state: false)
                })
                listFilter.append(contentsOf: listAvailableFilterValue ?? [])
            }
        })
        
        productData.availableFilters?.forEach { (availableFilter) in
            let idTitle = availableFilter.id ?? ""
            let nameTitle = availableFilter.name ?? ""
            
            if let _ = productData.filters?.first(where: { filter in
                return filter.id == availableFilter.id
            }) {

            } else {
                listFilter.append(FilterData(idTitle: idTitle, nameTitle: nameTitle, idValue: "", nameValue: "", isTitle: true, state: false))
                
                availableFilter.values?.forEach { (availableFilterValue) in
                    let idValue = availableFilterValue.id ?? ""
                    let nameValue = availableFilterValue.name ?? ""
                    var state = false
                    if let _ = productData.filters?.first(where: { (filter) -> Bool in
                        return filter.id == availableFilterValue.id
                    }) {
                        state = true
                    }
                    listFilter.append(FilterData(idTitle: idTitle, nameTitle: nameTitle, idValue: idValue, nameValue: nameValue, isTitle: false, state: state))
                }
            }
        }
        
        return listFilter
    }
    
    func setNewFilters(listFilterData: [FilterData], productData: ProductData) -> ProductData {
        let listFilterData1 = listFilterData.filter { (filterData) -> Bool in
            filterData.state == true
        }
        var filters = productData.filters ?? []
        let filtersAvailble = productData.availableFilters ?? []
        filtersAvailble.forEach { (filter) in
            if let filterSelect = listFilterData1.first(where: { (filterData) -> Bool in
                return filterData.idTitle == filter.id
            }) {
                let filterSend = Filter(id: filterSelect.idTitle, name: filterSelect.nameTitle, type: "", values: [FilterValue]())
                filter.values?.forEach { (availableFilterValue) in
                    if let filterValueSelect = listFilterData1.first(where: { (filterData) -> Bool in
                        return filterData.idValue == availableFilterValue.id
                    }) {
                        let filterValue = FilterValue(id: filterValueSelect.idValue, name: filterValueSelect.nameValue)
                        filterSend.values?.append(filterValue)
                    }
                }
                if !(filterSend.values?.isEmpty ?? false) {
                    filters.append(filterSend)
                }
            }
        }
        
        productData.filters = filters
        
        return productData
        
    }
    
    func addItems(numberOfItems: Int32, productData: ProductData) -> ProductData{
        var offset = productData.paging?.offset ?? 0
        if ((offset + Int(numberOfItems)) >= productData.paging?.total ?? 0) {
            offset = productData.paging?.offset ?? 0
        } else {
            offset += Int(numberOfItems)
        }


        let limit = Int(numberOfItems)
        
        productData.paging?.offset = offset
        productData.paging?.limit = limit
        
        return productData
    }
    
    func getCategoriesOfSites(countryId: String) {
        CatagoriesRepository.getCategoriesOfSites(countryId: countryId) { [weak self] success, listCategoryData, err in
            guard let self = self else {return}
            if success {
                if let listCategoryData = listCategoryData, !listCategoryData.isEmpty {
                    self.listProductsViewModelDelegate?.listProductsViewModel(succesGetCategories: listCategoryData)
                    return
                }
            }
            self.listProductsViewModelDelegate?.listProductsViewModel(onError: err ?? "No data".localized)
        }
    }
    
    func getProducts(countryId: String, productData: ProductData){
        ProductRepository.getProducts(countryCode: countryId, productData: productData) { [weak self] success, productData, err in
            guard let self = self else {return}
            if success {
                if let productData = productData {
                    self.listProductsViewModelDelegate?.listProductsViewModel(succesGetProduct: productData)
                    return
                }
            }
            self.listProductsViewModelDelegate?.listProductsViewModel(onError: err ?? "No data".localized)
        }
    }
    
    func getProducts(countryId: String, textSearch: String){
        ProductRepository.getProducts(countryCode: countryId, textSearch: textSearch) { [weak self] success, productData, err in
            guard let self = self else {return}
            if success {
                if let productData = productData {
                    self.listProductsViewModelDelegate?.listProductsViewModel(succesGetProduct: productData)
                    return
                }
            }
            self.listProductsViewModelDelegate?.listProductsViewModel(onError: err ?? "No data".localized)
        }
    }

    func geInternalSite(){
        let result = ContryRepository.getInternalSite()
        if result.error != "" {
            self.listProductsViewModelDelegate?.listProductsViewModel(onError: result.error)
        } else {
            if let site = result.countryData {
                getCategoriesOfSites(countryId: site.id ?? "")
                self.listProductsViewModelDelegate?.listProductsViewModel(succesGetSite: site)
            }
            
        }
    }
    
    func getKeepSite() -> String{
        return getString(didGetString: "keyKeepSite")
    }
}
protocol ListProductsViewModelDelegate: AnyObject {
    func listProductsViewModel(succesGetCategories categories: [CategoryData])
    func listProductsViewModel(succesGetSite siteModel: CountryData)
    func listProductsViewModel(onError error: String)
    func listProductsViewModel(succesGetProduct products: ProductData)
}

```
## Manejo de Generics
- se tomo la decicion de junto con el JSONDECODE manejar Generics para la deserializacion de informacion

```swift
func requestHttpwithUrl<T : Codable>(EpUrl: String, method: ApiServices.Method, withData parameters: [String:Any], modelType:T.Type, completionHandler: @escaping (Bool, T?, Error?) -> Void) {
        
        let request_url = URL(string: EpUrl)
        
        let request:NSMutableURLRequest = NSMutableURLRequest()
        print("[URL REQUEST=>]: \(request_url)")
        print("[PARAMETERS=>]: \(parameters)")
        request.url = request_url
        request.httpMethod = method.rawValue
        request.timeoutInterval = 30
        request.allHTTPHeaderFields = ["Content-Type": "application/json"]
        if method != .get {
            let postData = try? JSONSerialization.data(withJSONObject: parameters, options: [])
            request.httpBody = postData
        }
        let session = URLSession.init(configuration: .default)
        let task = session.dataTask(with: request as URLRequest, completionHandler: { (data, response, error) -> Void in
            let response = (response as? HTTPURLResponse)
            print("[CODE STATUS=>]: \(response)")
            if response?.statusCode == 200 || response?.statusCode == 201 {
                if let safeData = data {
                    let decoder = JSONDecoder()
                    do {
                        let textJson = String(decoding: safeData, as: UTF8.self)
                        print("[RESPONSE=>]: \(textJson)")
                        let decodedData = try decoder.decode(modelType, from: safeData)
                        DispatchQueue.main.async {
                            completionHandler(true, decodedData, nil)
                        }
                    } catch let error{
                        print(error.localizedDescription)
                        DispatchQueue.main.async {
                            completionHandler(false, nil, error)
                        }
                    }
                }else{
                    print("[ERROR=>]: \(error?.localizedDescription ?? "")")
                    DispatchQueue.main.async {
                        completionHandler(false, nil, error)
                    }
                }
            } else if response?.statusCode == 400 {
                if let safeData = data {
                    let decoder = JSONDecoder()
                    do {
                        let textJson = String(decoding: safeData, as: UTF8.self)
                        print("[RESPONSE=>]: \(textJson)")
                        let decodedData = try decoder.decode(modelType, from: safeData)
                        DispatchQueue.main.async {
                            completionHandler(true, decodedData, nil)
                        }
                    } catch let error {
                        print(error.localizedDescription)
                        DispatchQueue.main.async {
                            completionHandler(false, nil, error)
                        }
                    }
                }else{
                    print("[ERROR=>]: \(error?.localizedDescription ?? "")")
                    DispatchQueue.main.async {
                        completionHandler(false, nil, error)
                    }
                }
            } else {
                print("[ERROR=>]: \(error?.localizedDescription ?? "")")
                if let safeData = data{
                    let textJson = String(decoding: safeData, as: UTF8.self)
                    print("[RESPONSE=>]: \(textJson)")
                    let decoder = JSONDecoder()
                    DispatchQueue.main.async {
                        completionHandler(false, nil, nil)
                    }
                }else{
                    completionHandler(false, nil, nil)
                }
            }
        })
        task.resume()
    }
```

## Depliegue continuo(CD)
- se contemplo utilizar [fastlane](https://fastlane.tools/) pero al final nos fuimos por [bitrise](https://app.bitrise.io/) por que por medio de cajones por debamos nos construye nuestro documento [fastlane](https://fastlane.tools/)

- empezamos con la configuracion del proyecto seleccion del repo y la rama

![firebasestorage](https://firebasestorage.googleapis.com/v0/b/testyummy-26178.appspot.com/o/Captura%20de%20Pantalla%202021-10-26%20a%20la(s)%2012.20.37%20a.%C2%A0m..png?alt=media&token=162e5d7a-01f1-4b8b-9365-e4d773ec2cf8)

![firebasestorage](https://firebasestorage.googleapis.com/v0/b/testyummy-26178.appspot.com/o/Captura%20de%20Pantalla%202021-10-26%20a%20la(s)%2012.21.26%20a.%C2%A0m..png?alt=media&token=b32dbbed-f91e-49fa-ace2-a8f31a9b0896)

- al terminar la configuración encontraremos un dashboard con el resumen de nuestra configuración

![firebasestorage](https://firebasestorage.googleapis.com/v0/b/testyummy-26178.appspot.com/o/Captura%20de%20Pantalla%202021-10-26%20a%20la(s)%2012.22.40%20a.%C2%A0m..png?alt=media&token=b2fe0b65-072f-4c74-b1bd-b123d2e70496)

- posteriormente podemos empezar a gregar cajones que por debajo configuran nuestra fastlane o incluso otras herramientas

- en este caso agregaremos una de [firebase distribution](https://firebase.google.com/?gclid=CjwKCAjwq9mLBhB2EiwAuYdMtU3Cg_kLyrNm1v0lD4kAFiKr2atanP8hXV7_ifKCnyOyJ_uNDFPenBoC8NAQAvD_BwE&gclsrc=aw.ds)

![firebasestorage](https://firebasestorage.googleapis.com/v0/b/testyummy-26178.appspot.com/o/Captura%20de%20Pantalla%202021-10-26%20a%20la(s)%2012.27.45%20a.%C2%A0m..png?alt=media&token=8705c329-f616-484a-a26a-4bb627b0aa65)

- configuramos nuestra consola de firebase
- agregamos los correos a los que queremos liberar la version qa en develop segun ambiente


- y cada vez que hagamos un pull request a nuestra rama qa tendremos automáticamente un build con las características de workflow ya construidas


## Usuario y contraseña de prueba

- user: test@mail.com
- password: 12345678


## Video demostrativo Lista Productos

[![IMAGE ALT TEXT HERE](https://firebasestorage.googleapis.com/v0/b/testpira-eec30.appspot.com/o/Simulator%20Screen%20Shot%20-%20iPhone%2011%20Pro%20Max%20-%202023-04-30%20at%2018.48.54.png?alt=media&token=7779974b-fea8-4926-96bd-f3334857109c)](https://firebasestorage.googleapis.com/v0/b/testpira-eec30.appspot.com/o/Simulator%20Screen%20Recording%20-%20iPhone%2011%20Pro%20Max%20-%202023-04-30%20at%2018.49.52.mp4?alt=media&token=4d576a80-e2e9-4d08-90da-cfab9cd59bf6)

## Video demostrativo Detalle Productos

[![IMAGE ALT TEXT HERE](https://firebasestorage.googleapis.com/v0/b/testpira-eec30.appspot.com/o/Simulator%20Screen%20Shot%20-%20iPhone%2011%20Pro%20Max%20-%202023-04-30%20at%2018.49.01.png?alt=media&token=837f5ef2-b752-4cc9-8ef8-15fcdfcad4c1)](https://firebasestorage.googleapis.com/v0/b/testpira-eec30.appspot.com/o/Simulator%20Screen%20Recording%20-%20iPhone%2011%20Pro%20Max%20-%202023-04-30%20at%2018.50.10.mp4?alt=media&token=ca532236-b43e-4677-bc13-7e911f2f742b)
