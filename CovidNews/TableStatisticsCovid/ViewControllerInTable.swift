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
    
    override func viewDidLoad() {
        super.viewDidLoad()
   
    }
    
    func setupCellTable(country:Case){
        self.countryTitleInCell.title = country.country
        //self.confirmedLableInCell.text = String((country.recovered) ?? 0)
        //self.deathLableInCell.text = "\(country.latest.deaths)"
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

