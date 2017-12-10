//
//  DemoApiProjectTblVwC.swift
//  DemoApiProject
//
//  Created by Rabeeh KP on 29/11/17.
//  Copyright © 2017 Rabeeh KP. All rights reserved.
//

import UIKit
import Foundation
import Alamofire
import AlamofireObjectMapper
class DemoApiProjectTblVwC: UITableViewController {

    //MARK: -Variable
    var arrRes = [EachCard]()
    var Resps : EachCard?
    var newdate = Date()
    //MARK: -Outlets
    @IBOutlet weak var cancelBtn: UIBarButtonItem!
    
  
   
    //MARK: -ViewMethords
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let url = URL(string: "https://api.trello.com/1/boards/U709OKeN/lists/?key=6d71816ba273e5acc55d86fa57e66856&token=9723f17f7b7516ad4b81bb58d3f725fd1dee0265a9859b177c69ee9340d2eecd")
        Alamofire.request(url!, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: nil).responseArray{ (response:DataResponse<[EachCard]>) in
            print(response)
            let arrRes1 = response.result.value
            self.arrRes = arrRes1!
            self.tableView.reloadData()
        }
       
    
        tableView.estimatedRowHeight = 74
        tableView.rowHeight = UITableViewAutomaticDimension
        
        
    }

  
    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrRes.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! CardViewCell
        
        let resp = arrRes[indexPath.row]
        cell.TaskHeaderLabal.text = resp.name
        return cell
    }
    //MARK: -Table delegate
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let sendingId = arrRes[indexPath.row]
        let  storyboard =  UIStoryboard(name: "Main", bundle: nil)
        let  destination = storyboard.instantiateViewController(withIdentifier: "ShowApiTblVC") as! ShowApiTblVC
        destination.comingId = sendingId.id!
      
        self.navigationController?.pushViewController(destination, animated: true)
        
    }
    
    //MARK: -Action
    
    @IBAction func GoBack(_ sender: UIBarButtonItem) {
        dismiss(animated: false, completion: nil)
    }
    
 
}
extension Date{
    var formatted: String {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy mm dd"
        return  formatter.string(from: self)
    }
}

