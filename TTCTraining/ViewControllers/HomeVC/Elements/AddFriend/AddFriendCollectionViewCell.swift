//
//  AddFriendCollectionViewCell.swift
//  TTCTraining
//
//  Created by Apple on 10/24/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import UIKit

class AddFriendCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var profileImg: UIImageView!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var job: UILabel!
    @IBOutlet weak var btnAdd: UIButton!
    @IBOutlet weak var btnFollow: UIButton!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func configCell(_ data: Info){
        // config UI
        btnAdd.cornerRadius(5)
        btnFollow.cornerRadius(5)
        // Config Data
        profileImg.image = data.profileImg
        
        job.text = data.job
        name.text = data.name
    }
}
