//
//  CelebrityTableViewCell.swift
//  CelebrityList
//
//  Created by 吳昕桓 on 2017/1/9.
//  Copyright © 2017年 Clive Wu. All rights reserved.
//

import UIKit

class CelebrityTableViewCell: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var photoView: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
