//
//  Bored.swift
//  IAmBored
//
//  Created by Antonie on 2019/12/20.
//  Copyright © 2019 antonie. All rights reserved.
//

class Bored {
    
    struct BoredAPI: Codable {
        let activity: String?
        let accessibility: Double?
        let type: String?
        let participants: Int?
        let price: Double?
        let link: String?
        let key: String?
    }
    
}
