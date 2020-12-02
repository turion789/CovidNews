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
    @IBOutlet weak var customLogOut: UIButton!

    func custamButtonLogOut(){
        customLogOut.layer.cornerRadius = 11
        customLogOut.layer.masksToBounds = true
        customLogOut.layer.borderWidth = 2
        customLogOut.layer.borderColor = UIColor.black.cgColor
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        custamButtonLogOut()
        userNameLable.text! = redirectionLogo
        
    }
    
}


