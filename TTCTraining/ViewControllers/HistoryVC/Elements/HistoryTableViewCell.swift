//
//  HistoryTableViewCell.swift
//  TTCTraining
//
//  Created by Apple on 10/24/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import UIKit

class HistoryTableViewCell: UITableViewCell {
    @IBOutlet weak var tickImg: UIImageView!
    @IBOutlet weak var date: UILabel!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var position: UILabel!
    @IBOutlet weak var containView: UIView!
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func configCell(_ data: Info){
        // config UI
        containView.cornerRadius(10)
        // Config Data
        tickImg.image = data.tickImg
        position.text = data.position
        title.text = data.title
        date.text = data.date
    }
    
    
}
