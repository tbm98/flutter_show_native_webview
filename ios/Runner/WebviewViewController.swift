//
//  WebviewViewController.swift
//  Runner
//
//  Created by Tran Binh Minh on 9/22/20.
//

import UIKit
import WebKit

class WebviewViewController: UIViewController, WKUIDelegate {

    var webView: WKWebView!
    var url: String!

    override func viewDidLoad() {
        super.viewDidLoad()
        let myURL = URL(string:url)
        let myRequest = URLRequest(url: myURL!)
        webView.load(myRequest)
        // Do any additional setup after loading the view.
    }
    
    override func loadView() {
       let webConfiguration = WKWebViewConfiguration()
       webView = WKWebView(frame: .zero, configuration: webConfiguration)
       webView.uiDelegate = self
       view = webView
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
