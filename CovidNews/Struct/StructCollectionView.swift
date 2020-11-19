//
//  StructCollectionView.swift
//  CovidNews
//
//  Created by turion789 on 10.11.20.
//

import Foundation
import UIKit


//https://newsapi.org/v2/top-headlines?sources=bbc-news&apiKey=a6dbb9693ad24a18a56e0e881cd47c09

struct Welcome:Decodable {
    let status: String
    let totalResults: Int
    let articles: [Article]
}

// MARK: - Article
struct Article:Decodable {
  //  let source: Source
    let author: String?
    let title: String
   // let articleDescription: String?
    let url: String
    let urlToImage: String?
   // let publishedAt: Date
   // let content: String?
    
    enum CodingKeyNews:String, CodingKey {
            case author, title, url, urlToImage
        }
        init(author:String, title: String, url: String, urlToImage: String) {
            self.author = author
            self.title = title
            self.url = url
            self.urlToImage = urlToImage
        }
    
        init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeyNews.self)
            author = try container.decode(String.self, forKey: .author)
            title = try container.decode(String.self, forKey: .title)
            url = try container.decode(String.self, forKey: .url)
            urlToImage = try container.decode(String.self, forKey: .urlToImage)
    
        }
}


