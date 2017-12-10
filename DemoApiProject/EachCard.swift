//
//  ApiMapper.swift
//  DemoApiProject
//
//  Created by Rabeeh KP on 04/12/17.
//  Copyright © 2017 Rabeeh KP. All rights reserved.
//

import ObjectMapper

class EachCard: Mappable {
    
    var name = String()
    var shortUrl : String?
    var id : String?
    var dateLastActivity : String?

    
    required init?(map: Map) {
        mapping(map: map)
    }
    
    func mapping(map: Map) {
        name <- map["name"]
        shortUrl <- map["shortUrl"]
        id <- map["id"]
        dateLastActivity <- map ["dateLastActivity"]

    }
    
}
