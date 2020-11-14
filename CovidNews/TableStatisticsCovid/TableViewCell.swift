//
//  TableViewCell.swift
//  COVID-19
//
//  Created by turion789 on 3.11.20.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var confirmLable: UILabel!
    @IBOutlet weak var countryLable: UILabel!
    @IBOutlet weak var deathLable: UILabel!
    

//    func setupCellTable(country:Case){
//        self.countryLable.text = country.country
//        //self.confirmLable.text = "\(String(describing: country.infected))"
//       // self.deathLable.text = "Deaths: \(String(describing: country.recovered))"
//    }
 
}
