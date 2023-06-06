//
//  DialogWebViewViewController.swift
//  test_meli
//
//  Created by Pedro Alonso Daza B on 5/06/23.
//

import UIKit
import WebKit
class DialogWebViewViewController: UIViewController {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var webView: WKWebView!
    
    var titleText = ""
    var urlRecibed = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        initComponent()
        // Do any additional setup after loading the view.
    }
    

    func initComponent(){
        titleLabel.text = titleText
        if let url = URL(string: urlRecibed) {
            let request = NSURLRequest(url: url )
            webView.load(request as URLRequest)
        }
    }
}
//MARK: -Show
extension DialogWebViewViewController {
    static func show(controller: UIViewController, titleText: String, url: String) {
        let dialogWebViewViewController = DialogWebViewViewController(nibName: "DialogWebViewViewController", bundle: nil)
            
            dialogWebViewViewController.modalPresentationStyle = .popover
            dialogWebViewViewController.titleText = titleText
            dialogWebViewViewController.urlRecibed = url
            
        controller.present(dialogWebViewViewController, animated: true, completion: nil)
            
        
    }
}
