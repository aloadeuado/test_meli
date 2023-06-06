//
//  ListProductsViewController.swift
//  test_meli
//
//  Created by Pedro Alonso Daza B on 3/06/23.
//

import UIKit
import MaterialComponents.MaterialChips
import Toast_Swift
import ABLoaderView

class ListProductsViewController: UIViewController {
    @IBOutlet weak var searchBarView: SearchBarView!
    @IBOutlet weak var filterCategoryView: FilterCategoryView!
    @IBOutlet weak var sortSelectOptionView: SelectOptionView!
    
    @IBOutlet weak var filterSelected: CustomView!
    @IBOutlet weak var topProductCollectionViewLayout: NSLayoutConstraint!
    @IBOutlet weak var filtersLabel: UILabel!
    @IBOutlet weak var productCollectionView: UICollectionView!
    var listProductsViewModel: ListProductsViewModel?
    
    @IBOutlet weak var noDataView: UIView!
    var countryData = CountryData()
    var listCategoriesFilters = [FilterData]()
    var isLoadingProdcuts = false
    var isLoadingNewProducts = false
    var products = ProductData()
    var productsBefore = ProductData()
    var categories = [CategoryData]()
    var categoryText: String = ""
    var indexSelectedCategory = 0
    var numberOfItems: Int32 = 10
    var lastContentSizeHeight:CGFloat = 0
//Send Detail
    var result = Result()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initComponent()
        // Do any additional setup after loading the view.
    }
    
    func initComponent(){
        productCollectionView.register(ItemCollectionViewCell.nib(), forCellWithReuseIdentifier: ItemCollectionViewCell.identificador)
        listProductsViewModel = ListProductsViewModel(listProductsViewModelDelegate: self)
        filterCategoryView.setCategoryFilter(categoryTextArray: ["Option1", "Option1Option1", "Option1222", "Option1Option1"])
        filterCategoryView.showSpinner()
        filterCategoryView.delegate = self
        sortSelectOptionView.delegate = self
        searchBarView.delegate = self
        showTools()
        if listProductsViewModel?.getKeepSite() == "Save" {
            self.listProductsViewModel?.geInternalSite()
            return
        }
        listProductsViewModel?.getCategoriesOfSites(countryId: countryData.id ?? "")
    }

    func reloadDataProducts(){
        noDataView.isHidden = true
        showSpinner()
        products = ProductData()
        productsBefore = ProductData()
        products = listProductsViewModel?.setCatogoryProduct(nameCategory: categoryText, categoryModel: self.categories[indexSelectedCategory], productData: products) ?? products
        products = listProductsViewModel?.setInitOffsetAndLimit(numberOfItems: numberOfItems, productData: products) ?? products
        lastContentSizeHeight = 0
        
        loadDataProducts()
    }
    
    func loadDataProducts() {
        isLoadingProdcuts = true
        productCollectionView.reloadData()
        productsBefore = products
        listProductsViewModel?.getProducts(countryId: countryData.id ?? "", productData: products)
    }

    func loadSearchDataProducts(textSearch: String) {
        isLoadingProdcuts = true
        productCollectionView.reloadData()
        productsBefore = products
        listProductsViewModel?.getProducts(countryId: countryData.id ?? "", textSearch: textSearch)
    }
    
    func showTools(){
        self.topProductCollectionViewLayout.constant = -110
        UIView.animate(withDuration: 0.2, delay: 0, options: .curveEaseOut, animations: {
          
            
            self.topProductCollectionViewLayout.constant = 15
        }, completion: { finished in
            self.topProductCollectionViewLayout.constant = 15
            
        })
    }
    
    func hideTools(){
        self.topProductCollectionViewLayout.constant = 15
        UIView.animate(withDuration: 0.2, delay: 0, options: .curveEaseOut, animations: {
          
            
            self.topProductCollectionViewLayout.constant = -110
        }, completion: { finished in
            self.topProductCollectionViewLayout.constant = -110
            
        })
    }
    
    func showSpinner(){
        ABLoader().startShining(sortSelectOptionView)
        ABLoader().startShining(filterSelected)
    }
    
    func stopSpinner(){
        ABLoader().stopShining(sortSelectOptionView)
        ABLoader().stopShining(filterSelected)
    }
    //MARK: -Action
    @IBAction func selectFileterPressed(_ sender: UIButton) {
        DialogSelectMultiFilterViewController.show(controller: self, delegate: self, listFilters: listCategoriesFilters)
    }
    
}
//MARK: -SearchBarViewDelegate
extension ListProductsViewController: SearchBarViewDelegate {
    func searchBarView(didEdintingText text: String) {

        if text.count >= 1{
            hideTools()
            products = ProductData()
            productsBefore = ProductData()

            products = listProductsViewModel?.setInitOffsetAndLimit(numberOfItems: numberOfItems, productData: products) ?? products
            lastContentSizeHeight = 0
            
            loadSearchDataProducts(textSearch: text)
        
        } else {
            showTools()
            reloadDataProducts()
            // se reinician ambas variables para priorizar las seleccion de categoria
            
            
        }
        
    }
    
    func searchBarView(didClearText textBeforeClear: String) {
        showTools()
        // se reinician ambas variables para priorizar las seleccion de categoria
        reloadDataProducts()
    }
    
    
}
//MARK: -selectCategoryDelegate
extension ListProductsViewController: selectCategoryDelegate {
    func selectIndexCategory(index: Int, categoryText: String) {
        indexSelectedCategory = index
        self.categoryText = categoryText
        // se reinician ambas variables para priorizar las seleccion de categoria
        reloadDataProducts()
    }
}
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
//MARK: -SelectOptionViewDelegate
extension ListProductsViewController: SelectOptionViewDelegate {
    func selectOptionView(didSelectedItem item: String, index: Int) {
        //indexSelectedSort = index
        //loadProducts()
        self.products = listProductsViewModel?.setSortValue(nameSort: item, productData: self.products) ?? self.products
        products = listProductsViewModel?.setInitOffsetAndLimit(numberOfItems: numberOfItems, productData: products) ?? products
        lastContentSizeHeight = 0
        
        loadDataProducts()
        products = ProductData()
    }
    
    func selectOptionView(didCancel item: String) {
        
    }
}
//MARK: -FiltersTableViewDelegate
extension ListProductsViewController: FiltersTableViewDelegate{
    func filtersTableView(didGetFilter filterSelecter: FilterData, listFiltersSelecter: [FilterData]) {
        
        
    }
    
    func filtersTableView(aplyFilter listFiltersSelecter: [FilterData]) {
        self.listCategoriesFilters = listFiltersSelecter
        var text = ""
        listFiltersSelecter.forEach { (filterData) in
            text += (filterData.isTitle) ? "" : (filterData.state) ? filterData.nameTitle + ": " + filterData.nameValue + "  " : ""
            
        }
        
        filtersLabel.text = text
        
        self.products = listProductsViewModel?.setNewFilters(listFilterData: self.listCategoriesFilters, productData: self.products) ?? self.products
        products = listProductsViewModel?.setInitOffsetAndLimit(numberOfItems: numberOfItems, productData: products) ?? products
        lastContentSizeHeight = 0
        loadDataProducts()
        products = ProductData()
    }
    
    
}
//MARK: -UICollectionViewDataSource
extension ListProductsViewController: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {

        return isLoadingProdcuts ? 3 : (products.results ?? []).count + ((products.paging?.total ?? 0) <= ((self.products.paging?.offset ?? 0) + Int(numberOfItems)) ? 0 : 3)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ItemCollectionViewCell.identificador, for: indexPath) as? ItemCollectionViewCell else {
            return UICollectionViewCell()
        }

        if (indexPath.row) >= products.results?.count ?? 0 {
            cell.showSpinner()
        } else if (isLoadingProdcuts){
            cell.showSpinner()
        }else {
            cell.stopSpinner()
            cell.setValue(result: products.results?[indexPath.row] ?? Result())
        }
        return cell
    }
}
//MARK: -UICollectionViewDelegate
extension ListProductsViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        result = products.results?[indexPath.row] ?? Result()
        DetailProductViewController.navigationShow(controller: self, result: result)
    }
}
//MARK: -UICollectionViewLayout
extension ListProductsViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 165, height: 280)
    }
}
//MARK: -UIScrollViewDelegate
extension ListProductsViewController: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let contentScrollTrigger = scrollView.contentSize.height - 600
        if scrollView.contentOffset.y >= contentScrollTrigger {
            //initIndexOffset += (numberItemForPage + 1)
            if isLoadingNewProducts && !isLoadingProdcuts {
                if (products.paging?.total ?? 0) <= ((self.products.paging?.offset ?? 0) + Int(numberOfItems)) {
                    isLoadingNewProducts = false
                    return
                }
                self.products = listProductsViewModel?.addItems(numberOfItems: numberOfItems, productData: self.products) ?? self.products
                isLoadingNewProducts = false
                lastContentSizeHeight = scrollView.contentOffset.y
                
                loadDataProducts()
            }
            
        }else {
            isLoadingNewProducts = true
        }
        
        
    }
}
//MARK: -Show
extension ListProductsViewController {
    static func navigationShow(controller: UIViewController, countryData: CountryData) {
        let listProductsViewController = ListProductsViewController(nibName: "ListProductsViewController", bundle: nil)
        listProductsViewController.countryData = countryData
        controller.navigationController?.pushViewController(listProductsViewController, animated: true)
    }
}
