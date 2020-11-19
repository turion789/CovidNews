//
//  DetailNewsViewController.swift
//  CovidNews
//
//  Created by Vlad Steshik on 15.11.20.
//

import Foundation
import UIKit
import WebKit
var urlNews2222 = ""

class DetailNewsViewController: UIViewController, UIWebViewDelegate, WKUIDelegate{
    @IBOutlet weak var webView: WKWebView!
    @IBOutlet weak var lable:UILabel!
    
    override func loadView() {
           
            let webConfiguration = WKWebViewConfiguration()
            webView = WKWebView(frame: .zero, configuration: webConfiguration)
            webView.uiDelegate = self
            view = webView
        }
    override func viewDidLoad() {
            super.viewDidLoad()
            //let url = lable.text
            //print(lable.text!)
            let myURL = URL(string: "https://www.bbc.co.uk/news/live/world-54998339")

            let myRequest = URLRequest(url: myURL!)
            webView.load(myRequest)
        }
    
}

