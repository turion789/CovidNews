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


//import Foundation
//
//// MARK: - Welcome
//struct Welcome {
//    let status: String
//    let totalResults: Int
//    let articles: [Article]
//}
//
//// MARK: - Article
//struct Article {
//    let source: Source
//    let author, title, articleDescription: String
//    let url: String
//    let urlToImage: String
//    let publishedAt: Date
//    let content: String
//}
//
//// MARK: - Source
//struct Source {
//    let id: String?
//    let name: String
//}
