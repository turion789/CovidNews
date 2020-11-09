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
    
    
    var confirmed = ""
    var death = ""
    var country = ""

    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    func setupCellTable(country:Country){
        self.countryTitleInCell.title = country.country
       //self.confirmedLableInCell.text = String(country.latest.confirmed)
        //self.deathLableInCell.text = country.latest.deaths
        print(country.latest.deaths)
    }
  

    override func viewWillAppear(_ animated: Bool) {
            self.tabBarController?.tabBar.isHidden = true
        }
        
    
        override func viewWillDisappear(_ animated: Bool) {
            self.tabBarController?.tabBar.isHidden = false
        }
}
