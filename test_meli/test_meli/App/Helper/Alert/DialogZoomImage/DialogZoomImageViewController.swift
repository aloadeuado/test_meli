//
//  DialogZoomImageViewController.swift
//  test_meli
//
//  Created by Pedro Alonso Daza B on 5/06/23.
//

import UIKit
import ImageScrollView
import SDWebImage
class DialogZoomImageViewController: UIViewController {

    @IBOutlet weak var zoomImageScrollView: ImageScrollView!
    
    private var urlImage: String = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        initComponent()
        // Do any additional setup after loading the view.
    }
    
    func initComponent() {
        zoomImageScrollView.setup()
        let imageView = UIImageView()
        if let url = URL(string: urlImage) {
            imageView.sd_setImage(with: url) { [weak self] image, error, imageCacheType, url in
                guard let self = self else {return}
                if let image = image {
                    self.zoomImageScrollView.display(image: image)
                }
            }
        }
    }
    
    @IBAction func closePressed(button: UIButton) {
        self.dismiss(animated: true)
    }
}
//MARK: -show
extension DialogZoomImageViewController {
    static func show(controller: UIViewController, urlImage: String) {
        let dialogZoomImageViewController = DialogZoomImageViewController(nibName: "DialogZoomImageViewController", bundle: nil)
        dialogZoomImageViewController.urlImage = urlImage
        controller.present(dialogZoomImageViewController, animated: true)
    }
}
