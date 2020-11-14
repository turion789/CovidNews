//
//  NewsStruct.swift
//  collectionView
//
//  Created by turion789 on 3.11.20.
//

import Foundation
import UIKit




struct Case:Decodable  {
    var country:String
    var infected: Int?
    var recovered: Int?
    
    
    enum CodingKeys: String, CodingKey {
        case country,infected,recovered
    }


    init(country: String, infected: Int? = nil, recovered: Int? = nil) {
        self.country = country
        self.infected = infected
        self.recovered = recovered

    }

      init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        country = try container.decode(String.self, forKey: .country)
        infected = try? container.decode(Int.self, forKey: .infected)
        recovered = try? container.decode(Int.self, forKey: .recovered)
        
        
      }
}



