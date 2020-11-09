//
//  NewsStruct.swift
//  collectionView
//
//  Created by turion789 on 3.11.20.
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






struct Country: Codable {
    var country:String
    var latest: Latest
}

struct Latest:Codable {
    var confirmed: Int
    var deaths: Int
}

class StatisticsCovid{
    
    var statisticArray = [Country]()
    init() {
        setupTableView()
    }
    
    func setupTableView(){

        let cell1 = Country(country: "RB", latest: Latest(confirmed: 1, deaths: 2))
        let cell2 = Country(country: "R", latest: Latest(confirmed: 11, deaths: 21))
        let cell3 = Country(country: "RB11", latest: Latest(confirmed: 211, deaths: 122))
        self.statisticArray = [cell1,cell2,cell3]
        
    
    }
    
}




