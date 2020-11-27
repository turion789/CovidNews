//
//  tabBarViewController.swift
//  CovidNews
//
//  Created by Vlad Steshik on 18.11.20.
//

import UIKit

class tabBarViewController: UITabBarController {

    @IBOutlet weak var tabBarCustam: UITabBar!
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    func activateTab(tab: Int) {
        
        
        let borderLayer = CALayer()
        borderLayer.backgroundColor = UIColor.green.cgColor
        borderLayer.name = "active border"
        borderLayer.frame = CGRect(x: 10, y: 0, width: 10, height: 2)
    DispatchQueue.main.async {
            UIView.animate(withDuration: 0.8, delay: 0.0, options: [.curveEaseIn, .allowUserInteraction], animations: {})
            
        }
        
    }

}
