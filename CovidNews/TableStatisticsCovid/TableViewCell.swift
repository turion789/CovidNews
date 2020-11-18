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
    @IBOutlet weak var flagCountryImageView: UIImageView!
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style:style, reuseIdentifier:reuseIdentifier)
        self.formatCell()
        self.initialize()
    }
    
    required init?(coder aDecoder: NSCoder) {
       super.init(coder: aDecoder)
        self.formatCell()
        self.initialize()
    }
    func initialize() {
            
            let deathLable = UILabel(frame: .zero)
        deathLable.translatesAutoresizingMaskIntoConstraints = false
            self.contentView.addSubview(deathLable)
            self.deathLable = deathLable

            NSLayoutConstraint.activate([
                self.contentView.centerXAnchor.constraint(equalTo: self.deathLable.centerXAnchor),
                self.contentView.centerYAnchor.constraint(equalTo: self.deathLable.centerYAnchor),
            ])

            self.deathLable.font = UIFont.systemFont(ofSize: 64)
        }

        override func prepareForReuse() {
            super.prepareForReuse()

        }
    
    func formatCell() {
        //confirmLable.textColor = .black
        let confirmLable = UILabel(frame: .zero)
        confirmLable.translatesAutoresizingMaskIntoConstraints = false
        confirmLable.textColor = .cyan
                self.contentView.addSubview(confirmLable)
                self.confirmLable = confirmLable
        //self.contentView.backgroundColor = .black
        self.confirmLable.font = UIFont.boldSystemFont(ofSize: 16)
        self.confirmLable.textAlignment = .center
        self.confirmLable.textColor = .white
        }
    
    

    
    
    
//    private let productNameLabel : UILabel = {
//     let lbl = UILabel()
//     lbl.textColor = .black
//     lbl.font = UIFont.boldSystemFont(ofSize: 16)
//     lbl.textAlignment = .left
//     return lbl
//     }()
 
}
