//
//  CarouselImageViewController.swift
//  test_meli
//
//  Created by Pedro Alonso Daza B on 5/06/23.
//

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
