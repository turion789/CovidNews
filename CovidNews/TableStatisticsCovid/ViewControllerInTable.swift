//
//  ViewControllerInTable.swift
//  CovidNews
//
//  Created by turion789 on 5.11.20.
//

import UIKit

class ViewControllerInTable: UIViewController {
    
    @IBOutlet weak var confirmedLableInCell: UILabel!
    @IBOutlet weak var deathLableInCell: UILabel!
    @IBOutlet weak var countryTitleInCell: UINavigationItem!
    
    var deathCell = "Recovered: "
    var confirmedCell = "Infected: "
    
  
    override func viewDidLoad() {
        super.viewDidLoad()
        
        confirmedLableInCell.text = String(confirmedCell)
        deathLableInCell.text = String(deathCell)
        
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

