//
//  LogoOutViewController.swift
//  CovidNews
//
//  Created by turion789 on 5.11.20.
//

import Foundation
import UIKit

var redirectionLogo = ""

class LogoOutViewController: UIViewController{
    
    @IBOutlet weak var userNameLable: UILabel!
    @IBAction func logOutButton(_ sender: Any) {

        _ = navigationController?.popToRootViewController(animated: true)
  
    }

    override func viewDidLoad() {
       
        super.viewDidLoad()

        userNameLable.text! = redirectionLogo
    }
    
}
