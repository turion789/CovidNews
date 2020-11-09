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

    
    let titleCountry = UITabBarItem()
    

    func setupCellTable(country:Country){
        self.countryLable.text = "Country: \(country.country)"
        self.confirmLable.text = "Confirmed: \(country.latest.confirmed)"
        self.deathLable.text = "Deaths: \(country.latest.deaths)"
    }
 
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    

}
