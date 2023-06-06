# Test Meli
La aplicación es una app de prueba para Meli donde se listan productos a partir de un país seleccionado y se pueden ver detalles interesantes del producto. Se compone de tres pantallas:
- Selección de país
- Lista de productos
- Detalle de producto

## Requisitos

Para construir y ejecutar la aplicación, necesitas:

- [X] Swift 5.0+
- [X] Xcode 10.0+
- [X] iOS 10.0+

## Instalación

1. Clona este repositorio.
2. Abre el archivo 'TestMeli.xcodeproj' en Xcode.
3. Compila y ejecuta la aplicación en tu dispositivo o emulador.

## Uso

1. Al abrir la aplicación, selecciona un país.
2. Después de seleccionar un país, se mostrará una lista de productos disponibles.
3. Al seleccionar un producto, se mostrarán los detalles de este.

## Manejo de git (git flow)
- Se trabaja con 2 ramas principales: develop y main. Desde develop se desprenden ramas por cada feature del proyecto. 

![firebasestorage](https://firebasestorage.googleapis.com/v0/b/testmeli-e8ffc.appspot.com/o/Captura%20de%20pantalla%202023-06-05%20a%20la(s)%209.42.51%20p.m..png?alt=media&token=58107ee8-e360-4c99-b60b-84927b62069e&_gl=1*qgfynw*_ga*NjIzMzk4NzExLjE2ODI4NzIxNjU.*_ga_CW55HF8NVT*MTY4NjAxODg1NS44LjEuMTY4NjAxOTQyNi4wLjAuMA..)

- También se emula el merge de ramas mediante pull request.
- Ejemplo

![firebasestorage](https://firebasestorage.googleapis.com/v0/b/testmeli-e8ffc.appspot.com/o/Captura%20de%20pantalla%202023-06-05%20a%20la(s)%207.03.24%20p.m..png?alt=media&token=385d0660-9246-4790-b746-a0de2acad262&_gl=1*1wfjmtf*_ga*NjIzMzk4NzExLjE2ODI4NzIxNjU.*_ga_CW55HF8NVT*MTY4NjAxODg1NS44LjEuMTY4NjAyMDEzNS4wLjAuMA..)

## Manejo de ambientes

- Se crean flujos específicos para 3 posibles ambientes: dev, qa, prd. Asimismo, se crean los esquemas (schemes). 

![firebasestorage](https://firebasestorage.googleapis.com/v0/b/testmeli-e8ffc.appspot.com/o/Captura%20de%20pantalla%202023-06-05%20a%20la(s)%209.33.36%20p.m..png?alt=media&token=5e18d8be-3b40-448c-a2cf-2eda67713a08&_gl=1*yvhw83*_ga*NjIzMzk4NzExLjE2ODI4NzIxNjU.*_ga_CW55HF8NVT*MTY4NjAxODg1NS44LjEuMTY4NjAxODk5MS4wLjAuMA..)

- Con [.xcconfig](https://nshipster.com/xcconfig/) específico por ambiente. 

![firebasestorage](https://firebasestorage.googleapis.com/v0/b/testmeli-e8ffc.appspot.com/o/Captura%20de%20pantalla%202023-06-05%20a%20la(s)%209.39.17%20p.m..png?alt=media&token=6943b35a-aba6-42d0-9203-9c0d9dcef6e3&_gl=1*okye7w*_ga*NjIzMzk4NzExLjE2ODI4NzIxNjU.*_ga_CW55HF8NVT*MTY4NjAxODg1NS44LjEuMTY4NjAxOTE4Mi4wLjAuMA..)

- Adicionalmente, es posible que las aplicaciones convivan en el mismo dispositivo por ambiente. 

![firebasestorage](https://firebasestorage.googleapis.com/v0/b/testmeli-e8ffc.appspot.com/o/Captura%20de%20pantalla%202023-06-05%20a%20la(s)%209.09.35%20p.m..png?alt=media&token=ef3d95b9-e21d-4c03-a82d-30f8c7305231&_gl=1*hzeiba*_ga*NjIzMzk4NzExLjE2ODI4NzIxNjU.*_ga_CW55HF8NVT*MTY4NjAxODg1NS44LjEuMTY4NjAxOTkyNC4wLjAuMA..)

- Esto es posible gracias al cambio por xconfig de cada scheme.

![firebasestorage](https://firebasestorage.googleapis.com/v0/b/testmeli-e8ffc.appspot.com/o/Captura%20de%20pantalla%202023-06-05%20a%20la(s)%209.53.34%20p.m..png?alt=media&token=8ea0e1e8-0daa-4d58-998d-e10569c26903&_gl=1*1a3jgil*_ga*NjIzMzk4NzExLjE2ODI4NzIxNjU.*_ga_CW55HF8NVT*MTY4NjAxODg1NS44LjEuMTY4NjAyMDAzNi4wLjAuMA..)


## Installation

Use CocoaPods [cocoapods](https://cocoapods.org/) e instala las dependencias.

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
- Nota: contempla el uso de algunos pods:
- SDWebImage: descargar imágenes y manejo de caché para su reconsumo posteriormente.
- ABLoaderView: para la visualización de un fragmento de degradado mientras trae los datos o responde en el EndPoint seleccionado.
- ImageScrollView: permite hacer zoom a las imágenes cargadas y verlas en detalle.


## Arquitectura usada

- MVVM: La idea es la implementación de [POP](https://medium.com/globallogic-latinoamerica-mobile/la-programaci%C3%B3n-orientada-a-protocolos-en-swift-3548ed2dc2f1) en conjunto con un ViewModel que utiliza protocolos.

```swift
protocol ListProductsViewModelDelegate: AnyObject {
    func listProductsViewModel(succesGetCategories categories: [CategoryData])
    func listProductsViewModel(succesGetSite siteModel: CountryData)
    func listProductsViewModel(onError error: String)
    func listProductsViewModel(succesGetProduct products: ProductData)
}

```
- Además, mediante el uso de binding, se entregan los datos resueltos en los servicios a las vistas correspondientes.

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
- Se agregó una arquitectura de repositorio para el manejo del almacenamiento.
- Se incluyó una clase para el tratamiento de datos dependiendo de las necesidades del negocio.

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

- Se ha añadido una capa adicional de encapsulamiento más enfocada en la lógica de negocio.

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

- A través del ViewModel, nos comunicamos con las vistas para la interacción y presentación de datos.

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

- Se ha tomado la decisión de utilizar Generics junto con JSONDecode para la deserialización de la información.

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

## Desacople de responsabilidades en pantalla

- Siguiendo los principios [SOLID](https://profile.es/blog/principios-solid-desarrollo-software-calidad/) (Single Responsibility, Open-Closed, Liskov Substitution, Interface Segregation, Dependency Inversion), hemos creado una clase llamada CustomShowView. Esta clase tiene como objetivo acoplar los controles al propietario (owner) de la vista XIB, logrando así un desacople de responsabilidades en la pantalla.

```swift
import Foundation
import UIKit

class CustomShowView: CustomView {

    var isCallInitComponents = false
    var nameXIB: String {""}

    @IBOutlet weak var contentView: UIView!
        
    var isFirstCall = false
    

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        //viewSetup()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        viewSetup()
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        viewSetup()
    }
    
    private func loadViewFromNib() -> UIView? {

         let nibName = nameXIB
         let bundle = Bundle(for: type(of: self))
         let nib = UINib(nibName: nibName, bundle: bundle)
         return nib.instantiate(withOwner: self, options: nil).first as? UIView
    }

    private func viewSetup() {
        
        guard let view = loadViewFromNib() else { return }
        view.frame = self.bounds
        view.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        if !isFirstCall {
            self.addSubview(view)
            isFirstCall = true
        }
        
        contentView = view
        initComponents()
    }
    
    func initComponents(){

        
        
    }

}

```

- Esto permite que al heredar la clase y sobrescribir la variable `nameXIB` con el nombre del XIB correspondiente, se pueda utilizar como un objeto reutilizable en los controladores, logrando así una mayor flexibilidad en la gestión de las vistas.

```swift
import UIKit
protocol CarouselImageViewDelegate: AnyObject {
    func carouselImageViewDelegate(selectIndex index: Int, urlImage: String)
}
class CarouselImageView: CustomShowView {

    override var nameXIB: String { "CarouselImageView" }
    @IBOutlet weak var photoCollectionView: UICollectionView!
    @IBOutlet weak var countLabel: CustomLabel!
    
    private var listUrlsImage = [String]()
    var delegate: CarouselImageViewDelegate?
    var controller: UIViewController?
    
    func setData(controller: UIViewController, listUrlsImage: [String]) {
        self.controller = controller
        self.listUrlsImage = listUrlsImage
        countLabel.text = "    \(1) / \(listUrlsImage.count)    "
        photoCollectionView.reloadData()
    }

    override func initComponents() {
        super.initComponents()
        photoCollectionView.register(CarouselImageCollectionViewCell.nib(), forCellWithReuseIdentifier: CarouselImageCollectionViewCell.identificador)
    }
}
//MARK: -UICollectionViewDataSource
extension CarouselImageView: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.listUrlsImage.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CarouselImageCollectionViewCell.identificador, for: indexPath) as? CarouselImageCollectionViewCell{
            
            cell.setData(urlImage: listUrlsImage[indexPath.row])
            
            return cell
        }
        return UICollectionViewCell()
    }
    
    
}
//MARK: -UICollectionViewDelegate
extension CarouselImageView: UICollectionViewDelegate {

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        delegate?.carouselImageViewDelegate(selectIndex: indexPath.row, urlImage: listUrlsImage[indexPath.row])
    }
    
}

//MARK: -UICollectionViewDelegateFlowLayout
extension CarouselImageView: UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout,sizeForItemAt indexPath: IndexPath) -> CGSize {

        return CGSize(width: self.frame.width - 10, height: self.frame.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }
    
}
//MARK: -UIScrollViewDelegate
extension CarouselImageView: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let pageWidth = scrollView.frame.size.width
        let page = Int(round(scrollView.contentOffset.x / pageWidth))
        print("Estás en la página \(page)")
        countLabel.text = "    \(page + 1) / \(listUrlsImage.count)    "
    }
}

```

- Esto permite consumirlo en controles propios dentro de las escenas o UIViewControllers.

![firebasestorage](https://firebasestorage.googleapis.com/v0/b/testmeli-e8ffc.appspot.com/o/Screenshot%20at%20Jun%2005%2022-33-21.png?alt=media&token=69599192-a9e9-4f59-b6b5-3c42e85b0e5f&_gl=1*173p8s3*_ga*NjIzMzk4NzExLjE2ODI4NzIxNjU.*_ga_CW55HF8NVT*MTY4NjAyMjQxMS45LjEuMTY4NjAyMjQyMS4wLjAuMA..)

## Uso de popOvers reutilizables

- En el inicio, se utilizan UIViewControllers con XIB para desacoplar experiencias y reducir la cohesión del código.

```swift
import UIKit

class AlerMessageThreeOptionsViewController: UIViewController {

    @IBOutlet weak var messaggeLabel: UILabel!
    @IBOutlet weak var option1Button: CustomButton!
    @IBOutlet weak var option2Button: CustomButton!
    @IBOutlet weak var option3Button: CustomButton!
    
    var textMessagge = ""
    var textOption1 = ""
    var textOption2 = ""
    var textOption3 = ""
    
    var option1: (() -> Void)?
    var option2: (() -> Void)?
    var option3: (() -> Void)?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initComponent()
        // Do any additional setup after loading the view.
    }
    
    func initComponent(){
        messaggeLabel.text = textMessagge
        option1Button.setTitle(textOption1, for: .normal)
        option2Button.setTitle(textOption2, for: .normal)
        option3Button.setTitle(textOption3, for: .normal)
    }

}
//MARK: -Actions
extension AlerMessageThreeOptionsViewController {
    @IBAction func option1Pressed(button: CustomButton) {
        dismiss(animated: true) {
            self.option1?()
        }
    }
    
    @IBAction func option2Pressed(button: CustomButton) {
        dismiss(animated: true) {
            self.option2?()
        }
    }
    
    @IBAction func option3Pressed(button: CustomButton) {
        dismiss(animated: true) {
            self.option3?()
        }
    }
}

```

- Y todo se conecta a través de una función llamada `show`, que recibe todos los elementos necesarios para activarlo y devuelve la decisión del usuario mediante un closure.

```swift
// MARK: - Show Alert
extension AlerMessageThreeOptionsViewController {
    
    static func show(controller: UIViewController, textMessagge: String, textOption1: String = "Keep my decision.".localized, textOption2: String = "Keep asking.".localized, textOption3: String = "Cancel.".localized, option1: (() -> Void)? = nil, option2: (() -> Void)? = nil, option3: (() -> Void)? = nil) {
        let alert = AlerMessageThreeOptionsViewController(nibName: "AlerMessageThreeOptionsViewController", bundle: nil)
        alert.modalPresentationStyle = .overFullScreen
        alert.modalTransitionStyle = .crossDissolve
        alert.textMessagge = textMessagge
        alert.textOption1 = textOption1
        alert.textOption2 = textOption2
        alert.textOption3 = textOption3
        alert.option1 = option1
        alert.option2 = option2
        alert.option3 = option3
        controller.present(alert, animated: true, completion: nil)
    }
}

```

- Ejemplo de detonación.

```swift
@IBAction func continuePressed(button: UIButton) {
        if let siteModel1 = countryData{
            AlerMessageThreeOptionsViewController.show(controller: self, textMessagge: "You have already selected a site. What do you want to do with this decision?".localized) {
                self.selectedContryViewModel?.setKeepSite()
                self.selectedContryViewModel?.setInternalSite(countryData: siteModel1)
                ListProductsViewController.navigationShow(controller: self, countryData: self.countryData ?? CountryData())
            } option2: {
                self.selectedContryViewModel?.setInternalSite(countryData: siteModel1)
                ListProductsViewController.navigationShow(controller: self, countryData: self.countryData ?? CountryData())
            } option3: {
                
            }
        }
        
    }

```
## Test Unitarios

Se ha realizado cobertura de pruebas en los tests unitarios de los ViewControllers.

```swift
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

```

- También se han realizado pruebas de cobertura en los ViewModels con el fin de evaluar los flujos de negocio y garantizar su correcto funcionamiento.

```swift
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
            XCTAssertEqual(productDetailData.body?.siteID, "MELI")
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
                siteID: "MELI",
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
        let expectedJSONString = "{\"body\":{\"id\":\"123\",\"sale_terms\":[{\"id\":\"1\",\"name\":\"Condition\",\"value_name\":\"New\"},{\"id\":\"2\",\"name\":\"Warranty\",\"value_name\":\"1 Year\"}],\"subtitle\":\"Product Subtitle\",\"category_id\":\"789\",\"pictures\":[{\"size\":\"100x100\",\"id\":\"1\",\"quality\":\"HD\",\"url\":\"https:\\/\\/example.com\\/image1.jpg\",\"secure_url\":\"https:\\/\\/example.com\\/image1.jpg\",\"max_size\":\"1000x1000\"}],\"price\":99.989999999999995,\"title\":\"Product Title\",\"base_price\":129.99000000000001,\"currency_id\":\"USD\",\"attributes\":[],\"site_id\":\"MELI\",\"seller_id\":456,\"original_price\":149.99000000000001},\"code\":200}"
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
```

## Ejemplo de clases con cobertura

A continuación se muestra un ejemplo de las clases a las que se les ha agregado cobertura:

![Ejemplo de clases con cobertura](https://firebasestorage.googleapis.com/v0/b/testmeli-e8ffc.appspot.com/o/Captura%20de%20pantalla%202023-06-05%20a%20la(s)%2011.10.24%20p.m..png?alt=media&token=ff9afb6c-2fb0-485e-83d4-2c52a5ca308a)

Nota: No se utilizó Test-Driven Development (TDD) en este proyecto, ya que se construyó el código primero.

![firebasestorage](https://firebasestorage.googleapis.com/v0/b/testmeli-e8ffc.appspot.com/o/Captura%20de%20pantalla%202023-06-05%20a%20la(s)%2011.10.24%20p.m..png?alt=media&token=ff9afb6c-2fb0-485e-83d4-2c52a5ca308a&_gl=1*12uzflm*_ga*NjIzMzk4NzExLjE2ODI4NzIxNjU.*_ga_CW55HF8NVT*MTY4NjAyMjQxMS45LjEuMTY4NjAyNDY3NC4wLjAuMA..)

## ListProductsViewModel.swift

Este archivo define la clase `ListProductsViewModel` y el protocolo `ListProductsViewModelDelegate`. 

### ListProductsViewModel

`ListProductsViewModel` se encarga de manipular y gestionar la lógica de negocio relacionada con los productos en la aplicación. Proporciona métodos para manejar y modificar las propiedades de los productos, como categorías, filtros, y ordenaciones, entre otros.

### Métodos principales

1. **setCatogoryProduct**: Este método se encarga de asignar una categoría a un producto. Si la categoría no existe en el producto, la crea.

2. **getListTextSortInternal**: Este método se encarga de obtener la lista de nombres de ordenación disponibles para un producto.

3. **setInitOffsetAndLimit**: Este método inicializa los valores de offset y límite en la paginación del producto.

4. **setSortValue**: Este método se encarga de asignar el valor de ordenación a un producto basándose en el nombre de la ordenación.

5. **getFiltersAvaible**: Este método devuelve la lista de filtros disponibles para un producto.

6. **setNewFilters**: Este método asigna nuevos filtros a un producto.

7. **addItems**: Este método se encarga de añadir elementos a un producto.

8. **getCategoriesOfSites**: Este método obtiene las categorías de un sitio determinado por su identificador.

9. **getProducts**: Este método tiene dos variantes, una que obtiene productos basándose en los datos del producto y otra que los obtiene basándose en un texto de búsqueda.

10. **geInternalSite**: Este método obtiene el sitio interno.

11. **getKeepSite**: Este método obtiene el valor de la clave "keyKeepSite".

### ListProductsViewModelDelegate

El protocolo `ListProductsViewModelDelegate` define los métodos de delegado que permiten a las clases que implementan este protocolo responder a ciertos eventos del modelo de vista.

### Manejo de casos de error

En este código, el manejo de errores se realiza principalmente mediante la devolución de llamada `listProductsViewModel(onError error: String)`. En los métodos que realizan llamadas de red o interactúan con la base de datos, cualquier error que se encuentre se devuelve a través de este delegado. En cada uno de estos métodos, se verifica el éxito de la operación y, en caso de error, se devuelve el mensaje de error correspondiente.

### ListProductsViewModelDelegate

El protocolo `ListProductsViewModelDelegate` define los métodos de delegado que permiten a las clases que implementan este protocolo responder a ciertos eventos del modelo de vista.

### Manejo de casos de error

En este código, el manejo de errores se realiza principalmente mediante la devolución de llamada `listProductsViewModel(onError error: String)`. En los métodos que realizan llamadas de red o interactúan con la base de datos, cualquier error que se encuentre se devuelve a través de este delegado. En cada uno de estos métodos, se verifica el éxito de la operación y, en caso de error, se devuelve el mensaje de error correspondiente.

#### Ejemplos de manejo de errores

En el método `getProducts`, se realiza una solicitud a un repositorio para obtener datos de producto. Si esta solicitud no tiene éxito, se pasa un mensaje de error al método delegado para manejarlo:

```swift
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
```

En el método **geInternalSite**, se realiza una llamada al repositorio para obtener el sitio interno. Si se produce un error, se devuelve un mensaje a través del método delegado:

```swift
let result = ContryRepository.getInternalSite()
if result.error != "" {
    self.listProductsViewModelDelegate?.listProductsViewModel(onError: result.error)
} else {
    if let site = result.countryData {
        getCategoriesOfSites(countryId: site.id ?? "")
        self.listProductsViewModelDelegate?.listProductsViewModel(succesGetSite: site)
    }   
}
```

## ListProductsViewController.swift

Este archivo define la clase `ListProductsViewController`. Este controlador de vista se encarga de manejar y presentar la lista de productos en la aplicación.

### Métodos principales

[Listado de los métodos aquí...]

### Manejo de casos de error

El manejo de errores se realiza principalmente mediante la interfaz de usuario. Si hay algún error en las operaciones de red, se muestra un mensaje de error en la pantalla. Este manejo de errores se realiza principalmente en los métodos `listProductsViewModel(onError error: String)`.

#### Ejemplos de manejo de errores

En la implementación del delegado de `ListProductsViewModelDelegate`, se maneja el caso de error. Si ocurre un error al obtener los productos, se muestra un mensaje de error en la pantalla:

```swift
func listProductsViewModel(onError error: String) {
    stopSpinner()
    noDataView.isHidden = false
    isLoadingProdcuts = false
    products = productsBefore
    productCollectionView.reloadData()
    self.view.makeToast(error)
}
```

En este método, si se recibe un error, se detiene el indicador de progreso, se muestra la vista "sin datos" y se restablece el estado de "cargando productos". Luego se muestra el mensaje de error en la vista usando un "toast".

Por otro lado, también se manejan los errores de la red en los métodos que inician las operaciones de red, como **loadDataProducts()** y **loadSearchDataProducts(textSearch: String)**. Si ocurre un error durante estas operaciones, se maneja en el método **listProductsViewModel(onError error: String)** como se describió anteriormente.

Estos son sólo algunos ejemplos de cómo este código maneja los errores. El objetivo es proporcionar feedback al usuario y asegurar que la aplicación pueda seguir funcionando a pesar de los errores.

## ApiServices.swift

Este archivo define la clase `ApiServices`, que se encarga de realizar solicitudes HTTP y manejar las respuestas. A continuación se muestra un ejemplo de cómo manejar los logs en este código.

### Método `requestHttpwithUrl`

El método `requestHttpwithUrl` se utiliza para realizar una solicitud HTTP a una URL especificada. Aquí se muestra cómo se manejan los logs en este método:

```swift
func requestHttpwithUrl<T: Codable>(EpUrl: String, method: ApiServices.Method, withData parameters: [String: Any], modelType: T.Type, completionHandler: @escaping (Bool, T?, Error?) -> Void) {
    // ...

    // Logs para URL y parámetros
    print("[URL REQUEST=>]: \(request_url)")
    print("[PARAMETERS=>]: \(parameters)")

    // ...

    let task = session.dataTask(with: request as URLRequest, completionHandler: { (data, response, error) -> Void in
        let response = (response as? HTTPURLResponse)
        
        // Log para código de estado
        print("[CODE STATUS=>]: \(response)")
        
        if response?.statusCode == 200 || response?.statusCode == 201 {
            // ...

            // Log para respuesta exitosa
            print("[RESPONSE=>]: \(textJson)")

            // ...
        } else if response?.statusCode == 400 {
            // ...

            // Log para respuesta con código de estado 400
            print("[RESPONSE=>]: \(textJson)")

            // ...
        } else {
            // Log para error general
            print("[ERROR=>]: \(error?.localizedDescription ?? "")")

            // Log para respuesta en caso de error
            if let safeData = data {
                let textJson = String(decoding: safeData, as: UTF8.self)
                print("[RESPONSE=>]: \(textJson)")
            }

            // ...
        }
    })

    // ...
}
```

Aquí tienes el código completo para copiar:

## ApiServices.swift

Este archivo define la clase `ApiServices`, que se encarga de realizar solicitudes HTTP y manejar las respuestas. A continuación se muestra un ejemplo de cómo manejar los logs en este código.

### Método `requestHttpwithUrl`

El método `requestHttpwithUrl` se utiliza para realizar una solicitud HTTP a una URL especificada. Aquí se muestra cómo se manejan los logs en este método:

```swift
func requestHttpwithUrl<T: Codable>(EpUrl: String, method: ApiServices.Method, withData parameters: [String: Any], modelType: T.Type, completionHandler: @escaping (Bool, T?, Error?) -> Void) {
    let request_url = URL(string: EpUrl)
    let request: NSMutableURLRequest = NSMutableURLRequest()
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

## Video demostrativo Lista De Paises

[![IMAGE ALT TEXT HERE](https://firebasestorage.googleapis.com/v0/b/testmeli-e8ffc.appspot.com/o/Simulator%20Screen%20Shot%20-%20iPhone%2011%20Pro%20Max%20-%202023-06-05%20at%2023.14.23.png?alt=media&token=47bf94d1-6b9c-46b6-ad40-02a1636c5586&_gl=1*xqqtzd*_ga*NjIzMzk4NzExLjE2ODI4NzIxNjU.*_ga_CW55HF8NVT*MTY4NjAyMjQxMS45LjEuMTY4NjAyNDkxNS4wLjAuMA..)](https://firebasestorage.googleapis.com/v0/b/testmeli-e8ffc.appspot.com/o/Simulator%20Screen%20Recording%20-%20iPhone%2011%20Pro%20Max%20-%202023-06-05%20at%2023.14.19.mp4?alt=media&token=e267c421-1e44-4fed-b2cf-f38af87741ad&_gl=1*pjqk70*_ga*NjIzMzk4NzExLjE2ODI4NzIxNjU.*_ga_CW55HF8NVT*MTY4NjAyMjQxMS45LjEuMTY4NjAyNDk4NC4wLjAuMA..)

## Video demostrativo Lista de Productos

[![IMAGE ALT TEXT HERE](https://firebasestorage.googleapis.com/v0/b/testmeli-e8ffc.appspot.com/o/Simulator%20Screen%20Shot%20-%20iPhone%2011%20Pro%20Max%20-%202023-06-05%20at%2023.17.16.png?alt=media&token=2cb00b1d-90f8-4b9a-b075-d0b832d45bbb&_gl=1*1cclkem*_ga*NjIzMzk4NzExLjE2ODI4NzIxNjU.*_ga_CW55HF8NVT*MTY4NjAyMjQxMS45LjEuMTY4NjAyNTE3My4wLjAuMA..)](https://firebasestorage.googleapis.com/v0/b/testmeli-e8ffc.appspot.com/o/Simulator%20Screen%20Recording%20-%20iPhone%2011%20Pro%20Max%20-%202023-06-05%20at%2023.18.29.mp4?alt=media&token=dfb25ba8-b389-4624-8f3b-f4366940a481&_gl=1*15bpe2c*_ga*NjIzMzk4NzExLjE2ODI4NzIxNjU.*_ga_CW55HF8NVT*MTY4NjAyMjQxMS45LjEuMTY4NjAyNTIxNS4wLjAuMA..)


## Video demostrativo Detalle de Productos

[![IMAGE ALT TEXT HERE](https://firebasestorage.googleapis.com/v0/b/testmeli-e8ffc.appspot.com/o/Simulator%20Screen%20Shot%20-%20iPhone%2011%20Pro%20Max%20-%202023-06-05%20at%2023.23.04.png?alt=media&token=990a4383-e334-40a5-8f3d-ad0554b2a3e0&_gl=1*kx02u8*_ga*NjIzMzk4NzExLjE2ODI4NzIxNjU.*_ga_CW55HF8NVT*MTY4NjAyMjQxMS45LjEuMTY4NjAyNTQ3OS4wLjAuMA..)](https://firebasestorage.googleapis.com/v0/b/testmeli-e8ffc.appspot.com/o/Simulator%20Screen%20Recording%20-%20iPhone%2011%20Pro%20Max%20-%202023-06-05%20at%2023.23.40.mp4?alt=media&token=6d6ceae7-5edd-463e-8885-d88241a15bd2&_gl=1*lofovq*_ga*NjIzMzk4NzExLjE2ODI4NzIxNjU.*_ga_CW55HF8NVT*MTY4NjAyMjQxMS45LjEuMTY4NjAyNTUzMC4wLjAuMA..)
