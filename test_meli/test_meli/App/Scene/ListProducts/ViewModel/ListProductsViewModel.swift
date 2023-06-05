//
//  ListProductsViewModel.swift
//  test_meli
//
//  Created by Pedro Alonso Daza B on 3/06/23.
//

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
            self.listProductsViewModelDelegate?.listProductsViewModel(onError: err ?? "")
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
            self.listProductsViewModelDelegate?.listProductsViewModel(onError: err ?? "")
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
            self.listProductsViewModelDelegate?.listProductsViewModel(onError: err ?? "")
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
protocol ListProductsViewModelDelegate {
    func listProductsViewModel(succesGetCategories categories: [CategoryData])
    func listProductsViewModel(succesGetSite siteModel: CountryData)
    func listProductsViewModel(onError error: String)
    func listProductsViewModel(succesGetProduct products: ProductData)
}
