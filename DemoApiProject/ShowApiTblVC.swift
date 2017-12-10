//
//  ShowApiTblVC.swift
//  DemoApiProject
//
//  Created by Rabeeh KP on 08/12/17.
//  Copyright © 2017 Rabeeh KP. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireObjectMapper

class ShowApiTblVC: UITableViewController {
    
    //MARK: -Variables
    var showResp = [EachCard]()
    var comingId = String()
    
    //MARK: -Outlets
    @IBOutlet weak var BackBtnOutlet: UIBarButtonItem!
    
    //MARK: -ViewMethords
    override func viewDidLoad() {
        super.viewDidLoad()
        let url = URL(string: "https://api.trello.com/1/lists/\(comingId)/cards/?key=e3777605579bfd3c061d8703ea23c4e1&token=eea7277d2142fd0cb0ad9ab5d5262fb32657de7a9a409fcc6d57d0caf2ee1008")
        
        Alamofire.request(url!, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: nil).responseArray{ (response:DataResponse<[EachCard]>) in
            print(response)
            let showRespo = response.result.value
            self.showResp = showRespo!
            self.tableView.reloadData()
        }
       tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 74
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return showResp.count
    }


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ShowCell", for: indexPath) as! ShowTrelloCardCell
        let response = showResp[indexPath.row]
     cell.ShowTitleLbl.text = response.name
        let mm = response.dateLastActivity!
                let myDateString = mm
                //"2016-01-01 04:31:32.0"
        
                let dateFormatter = DateFormatter()
                dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
                let myDate = dateFormatter.date(from: myDateString)!
        
                dateFormatter.dateFormat = "MMM dd, YYYY"
                let somedateString = dateFormatter.string(from: myDate)
        cell.ShowDateLbl.text = somedateString

        return cell
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let sendingData = showResp[indexPath.row]
        let  storyboard =  UIStoryboard(name: "Main", bundle: nil)
        let  destination = storyboard.instantiateViewController(withIdentifier: "UpdateApiVC") as! UpdateApiVC
        destination.dates = sendingData.dateLastActivity!
        destination.texts = sendingData.name
        destination.ComingId = comingId
        destination.cardId = sendingData.id!
        self.navigationController?.pushViewController(destination, animated: true)
    }
    
    //MARK: -Action
    
    @IBAction func GoBack(_ sender: UIBarButtonItem) {
        dismiss(animated: false, completion: nil)
    }
    
 
}
