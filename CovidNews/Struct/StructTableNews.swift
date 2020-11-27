//
//  NewsStruct.swift
//  collectionView
//
//  Created by turion789 on 3.11.20.
//

import Foundation
import UIKit


struct COVID:Decodable {
    let countryRegion: String
    let provinceState: String?
    let confirmed, recovered, deaths: Int
    
    enum CodingKeys: String, CodingKey {
        case countryRegion,provinceState,confirmed,recovered,deaths
        
    }
    
    init(countryRegion: String, provinceState: String?, confirmed:Int, recovered: Int, deaths: Int) {
        self.countryRegion = countryRegion
        self.provinceState = provinceState
        self.confirmed = confirmed
        self.recovered = recovered
        self.deaths = deaths
        
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        countryRegion = try container.decode(String.self, forKey: .countryRegion)
        provinceState = try? container.decode(String.self, forKey: .provinceState)
        confirmed = try! container.decode(Int.self, forKey: .confirmed)
        recovered = try! container.decode(Int.self, forKey: .recovered)
        deaths = try! container.decode(Int.self, forKey: .deaths)
        
    }
    
}
    
