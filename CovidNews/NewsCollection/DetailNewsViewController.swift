//
//  DetailNewsViewController.swift
//  CovidNews
//
//  Created by Vlad Steshik on 15.11.20.
//

import Foundation
import UIKit
import WebKit


class DetailNewsViewController: UIViewController, UIWebViewDelegate, WKUIDelegate{
    @IBOutlet weak var webView: WKWebView!
    var myURL = ""
    override func loadView() {
        let webConfiguration = WKWebViewConfiguration()
        webView = WKWebView(frame: .zero, configuration: webConfiguration)
        webView.uiDelegate = self
        view = webView
        
    }
    override func viewDidLoad(){
        super.viewDidLoad()
        myURL.insert("s", at: myURL.index(myURL.startIndex, offsetBy: 4))
        let url = URL(string: myURL)
        let myRequest = URLRequest(url: url!)
        webView.load(myRequest)
        
    }
    override var hidesBottomBarWhenPushed: Bool {
        get {
            return navigationController?.topViewController == self
        }
        set {
            super.hidesBottomBarWhenPushed = newValue
            
        }
        
    }
    
}

