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
        tabBarCustam.barStyle = .black
//        tabBarCustam.layer.borderColor = UIColor.cyan.cgColor

        // Do any additional setup after loading the view.
    }
    func activateTab(tab: Int) {
        
        
        let borderLayer = CALayer()
        borderLayer.backgroundColor = UIColor.green.cgColor
        borderLayer.name = "active border"
        borderLayer.frame = CGRect(x: 10, y: 0, width: 10, height: 2)
    DispatchQueue.main.async {
            UIView.animate(withDuration: 0.8, delay: 0.0, options: [.curveEaseIn, .allowUserInteraction], animations: {
                
            })
            
        }
        
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
