//
//  NewsCollectionCell.swift
//  CovidNews
//
//  Created by turion789 on 5.11.20.
//

import UIKit

class NewsCollectionCell: UICollectionViewCell {
    
    @IBOutlet weak var authorNews: UILabel!
    @IBOutlet weak var titleNews: UILabel!

    
    func setupCell(article:Article){
        self.titleNews.text = article.title
        self.authorNews.text = article.author
    }
    
}
