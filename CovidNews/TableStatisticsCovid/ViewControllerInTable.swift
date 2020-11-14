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
    
    
    //var confirmed = ""
//    var death = ""
//    var country = ""

    
    override func viewDidLoad() {
        super.viewDidLoad()
   
   
    }
    
    
    ///struct Point {
    ///         let x: Int, y: Int
    ///     }
    ///
    ///     let p = Point(x: 21, y: 30)
    ///     print(String(describing: p))
    ///     // Prints "Point(x: 21, y: 30)"
    ///
    /// After adding `CustomStringConvertible` conformance by implementing the
    /// `description` property, `Point` provides its own custom representation.
    ///
    ///     extension Point: CustomStringConvertible {
    ///         var description: String {
    ///             return "(\(x), \(y))"
    ///         }
    ///     }
    ///
    ///     print(String(describing: p))
    ///     // Prints "(21, 30)"
    
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

