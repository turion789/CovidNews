//
//  StructCollectionView.swift
//  CovidNews
//
//  Created by turion789 on 10.11.20.
//

import Foundation
import UIKit


struct Article: Codable {
    let author: String
    let title: String
}

class News{
    
    var newsArray = [Article]()
    
    init() {
        setupCollectionView()
    }
    
    func setupCollectionView(){
        let news1 = Article(author: "Vasia", title: "Опасно")
        let news2 = Article(author: "Петя", title: "Опасно")
        let news3 = Article(author: "Ира", title: "Опасно")
        let news4 = Article(author: "Валера", title: "Опасно")
        self.newsArray = [news1,news2,news3,news4]
    }
}

