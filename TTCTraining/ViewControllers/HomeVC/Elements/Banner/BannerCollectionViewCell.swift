//
//  BannerCollectionViewCell.swift
//  TTCTraining
//
//  Created by Apple on 10/24/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import UIKit

class BannerCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var position: UILabel!
    @IBOutlet weak var place: UILabel!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var profileImg: UIImageView!
    @IBOutlet weak var time: UILabel!
    @IBOutlet weak var date: UILabel!
    @IBOutlet weak var mainImg: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
    }
    func configCell(_ data: Info){
        // config UI
        profileImg.cornerRadius(40)
        // Config Data
        mainImg.image = data.mainImg
        profileImg.image = data.profileImg
        position.text = data.position
        place.text = data.place
        title.text = data.title
        time.text = data.time
        date.text = data.date
    }

}
