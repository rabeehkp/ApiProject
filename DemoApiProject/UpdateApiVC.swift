//
//  UpdateApiVC.swift
//  DemoApiProject
//
//  Created by Rabeeh KP on 08/12/17.
//  Copyright © 2017 Rabeeh KP. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireObjectMapper
class UpdateApiVC: UIViewController {

    //MARK: -Variables
    var dates = String()
    var texts = String()
    var ComingId = String()
    var cardId = String()
    
    //MARK: -Outlets
    @IBOutlet weak var txtTitleView: UITextView!
    @IBOutlet weak var DateLbl: UILabel!
    @IBOutlet weak var UpdatePost: UIButton!
    
    //MARK: -ViewMethords
    override func viewDidLoad() {
        super.viewDidLoad()
       txtTitleView.text = texts
        //Date Mode
        let myDateString = dates
        //"2016-01-01 04:31:32.0"
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
        let myDate = dateFormatter.date(from: myDateString)!
        
        dateFormatter.dateFormat = "MMM dd, YYYY"
        let somedateString = dateFormatter.string(from: myDate)
        //
        DateLbl.text = somedateString

        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func UpdatePostBtn(_ sender: UIButton) {
        let url = URL(string: "https://api.trello.com/1/cards/\(cardId)/?key=e3777605579bfd3c061d8703ea23c4e1&token=eea7277d2142fd0cb0ad9ab5d5262fb32657de7a9a409fcc6d57d0caf2ee1008")
        let params = ["name" : txtTitleView.text]
        Alamofire.request(url!, method: .put , parameters: params, encoding: JSONEncoding.default).responseString { (response) in
            
            print(response)
            
        }
    
    }
    
    

}
