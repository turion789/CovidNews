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
    @IBOutlet weak var imageBackground: UIImageView!
    @IBOutlet weak var urlNews: UILabel!

    
    //var urlNews1 = ""
    var wqw1 = ""
    
    required init?(coder aDecoder: NSCoder) {
       super.init(coder: aDecoder)
       
    }
    
    
    func setupCell(article:Article){
        //self.titleNews.text = article.title
        self.authorNews.text = article.author
    }
    
    
//    @IBAction func passData() {
//        let storyboard = UIStoryboard(name: "Main", bundle: nil)
//        guard let DetailNewsViewController = storyboard.instantiateViewController(identifier: "DetailNewsViewController") as? DetailNewsViewController else { return }
//        DetailNewsViewController.urlNews2222 = "\(wqw1)"
//
//    }
    
    
    
}

