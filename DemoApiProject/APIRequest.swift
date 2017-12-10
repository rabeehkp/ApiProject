//
//  APIRequest.swift
//  DemoApiProject
//
//  Created by Rabeeh KP on 04/12/17.
//  Copyright © 2017 Rabeeh KP. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireObjectMapper

class APIRequest: NSObject {
    var returnValue = [EachCard]()
    var returnString = String()
    func fetchCardDetails() //-> ((EachCard) -> EachCard)
    {
        let url = URL(string: "https://api.trello.com/1/boards/U709OKeN/cards/?key=e3777605579bfd3c061d8703ea23c4e1&token=eea7277d2142fd0cb0ad9ab5d5262fb32657de7a9a409fcc6d57d0caf2ee1008")

        Alamofire.request(url!, method: .get, parameters: nil, encoding: JSONEncoding.default, headers:nil).responseArray{ (response:DataResponse<[EachCard]>) in
             print(response.result.value)
            
           
       }
        
    }
}
