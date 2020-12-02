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
    
    var recoveredInCell = NSLocalizedString("Recovered: ", comment: "var Recovered in cell")
    var allInfectedPeople = NSLocalizedString("Infected: ", comment: "var Infected in cell")
    
  
    override func viewDidLoad() {
        super.viewDidLoad()
        
        confirmedLableInCell.text = String(allInfectedPeople)
        deathLableInCell.text = String(recoveredInCell)
        
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

