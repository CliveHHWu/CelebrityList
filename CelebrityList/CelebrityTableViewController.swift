//
//  CelebrityTableViewController.swift
//  CelebrityList
//
//  Created by 吳昕桓 on 2017/1/9.
//  Copyright © 2017年 Clive Wu. All rights reserved.
//

import UIKit

class CelebrityTableViewController: UITableViewController {

    var isAddCelebrity = false
    
    var celebrities = [[String:String]]()
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        if isAddCelebrity {
            isAddCelebrity = false
            let indexPath = IndexPath(row: 0, section: 0)
            self.tableView.insertRows(at: [indexPath], with: .automatic)
            
            
        }
    }
    
    func updateFile() {
        let fileManager = FileManager.default
        let docUrls =
            fileManager.urls(for: .documentDirectory, in: .userDomainMask)
        let docUrl = docUrls.first
        let url = docUrl?.appendingPathComponent("celebrities.txt")
        let result = (celebrities as NSArray).write(to: url!, atomically: true)
        
        print("result \(result)")
        
        
    }
    
    func addCelebrityNoti(noti:Notification) {
        let dic = noti.userInfo as! [String:String]
        celebrities.insert(dic, at: 0)
        
        updateFile()
        
        isAddCelebrity = true
        
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        
        
        let fileManager = FileManager.default
        let docUrls =
            fileManager.urls(for: .documentDirectory, in: .userDomainMask)
        let docUrl = docUrls.first
        let url = docUrl?.appendingPathComponent("celebrities.txt")
        let array = NSArray(contentsOf: url!)
        if array != nil {
            celebrities = array as! [[String:String]]
            
        }
        
        
        let notiName = Notification.Name("addCelebrity")
        NotificationCenter.default.addObserver(self, selector: #selector(CelebrityTableViewController.addCelebrityNoti(noti:)), name: notiName, object: nil)
        
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
        return celebrities.count
        
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "CelebrityCell", for: indexPath) as! CelebrityTableViewCell
        let dic = celebrities[indexPath.row]
        
        let fileManager = FileManager.default
        let docUrls =
            fileManager.urls(for: .documentDirectory, in: .userDomainMask)
        let docUrl = docUrls.first
        let url = docUrl?.appendingPathComponent("\(dic["name"]!).png")
        
        
        
        cell.photoView.image = UIImage(contentsOfFile: url!.path)
        
        cell.nameLabel.text = dic["name"]
        
        return cell
    }
    
    
    /*
     // Override to support conditional editing of the table view.
     override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
     // Return false if you do not want the specified item to be editable.
     return true
     }
     */
    
    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        
        let controller = UIAlertController(title: "確定要 delete 嗎", message: nil, preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Yes", style: .default) { (action) in
            
            self.celebrities.remove(at: indexPath.row)
            self.updateFile()
            
            
            self.tableView.deleteRows(at: [indexPath], with: .automatic)
            
            
            
        }
        
        controller.addAction(action)
        
        let action2 = UIAlertAction(title: "No", style: .cancel, handler: nil)
        controller.addAction(action2)
        
        present(controller, animated: true, completion: nil)
        
        
        
        
        
    }
    
    
    /*
     // Override to support rearranging the table view.
     override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
     
     }
     */
    
    /*
     // Override to support conditional rearranging of the table view.
     override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
     // Return false if you do not want the item to be re-orderable.
     return true
     }
     */
    
    
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        
        if segue.identifier == "Detail" {
            let controller = segue.destination as! CelebrityDetailViewController
            let indexPath = self.tableView.indexPathForSelectedRow
            controller.celebrityInfoDic = celebrities[indexPath!.row]
        }
        
        
        
        
    }

}
