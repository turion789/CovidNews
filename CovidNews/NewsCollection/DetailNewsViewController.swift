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
    
    var urlNews2222 = "https:www.bbc.co.uk/news/health-54986208"
    
 
        
        override func loadView() {
            let webConfiguration = WKWebViewConfiguration()
            webView = WKWebView(frame: .zero, configuration: webConfiguration)
            webView.uiDelegate = self
            view = webView
        }
        override func viewDidLoad() {
            super.viewDidLoad()
            let myURL = URL(string:"\(String(urlNews2222))")
            
            let myRequest = URLRequest(url: myURL!)
            webView.load(myRequest)
        }
    
}

