//
//  HomeTableViewCell.swift
//  TTCTraining
//
//  Created by Apple on 10/24/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import UIKit

class HomeTableViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    @IBOutlet weak var containView: UIView!
    @IBOutlet weak var mainImg: UIImageView!
    @IBOutlet weak var hashtag: UILabel!
    @IBOutlet weak var section: UILabel!
    @IBOutlet weak var place: UILabel!
    @IBOutlet weak var btnInfo: UIButton!
    @IBOutlet weak var position: UILabel!
    @IBAction func btnInfo(_ sender: Any) {
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func configCell(_ data: Info){
        // config UI
        btnInfo.cornerRadius(5)
        containView.layer.borderWidth = 5
        containView.layer.borderColor = #colorLiteral(red: 0.9253895879, green: 0.9255481362, blue: 0.9253795743, alpha: 1)
        // Config Data
        mainImg.image = data.mainImg
        position.text = data.position
        hashtag.text = "#hanoi"
        section.text = "địa điểm du lịch"
        place.text = data.place
    }
    
    
}
