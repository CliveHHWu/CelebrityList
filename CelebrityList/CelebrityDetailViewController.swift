//
//  CelebrityDetailViewController.swift
//  CelebrityList
//
//  Created by 吳昕桓 on 2017/1/9.
//  Copyright © 2017年 Clive Wu. All rights reserved.
//

import UIKit

class CelebrityDetailViewController: UIViewController {

    var celebrityInfoDic:[String:String]!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var ageLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        nameLabel.text = celebrityInfoDic["name"]!
        ageLabel.text = celebrityInfoDic["age"]!
        
        self.navigationItem.title = celebrityInfoDic["name"]!
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
