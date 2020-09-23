//
//  PostedTBVCell.swift
//  TTCTraining
//
//  Created by Bui Tam on 8/14/20.
//  Copyright © 2020 Apple. All rights reserved.
//

import UIKit

class PostedTBVCell: UITableViewCell {

    @IBOutlet weak var currentName: UILabel!
    @IBOutlet weak var profileImage: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        setImageProfile(profileImage: profileImage)
        currentName.text = UserDefaults.standard.value(forKey: "name") as? String
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBOutlet weak var btnCheckIn: UIButton!
    @IBOutlet weak var contentPost: UILabel!
    @IBOutlet weak var imgPost: UIImageView!
    
    func configCell(_ data: PostModel){
        contentPost.text = data.contentPost
        let path = "postImages/\(data.userPostName)_post.png"
        StorageManager.shared.downloadURL(for: path, completion: { [weak self] result in
            switch result {
            case .success(let url):

                DispatchQueue.main.async {
                    self?.imgPost.sd_setImage(with: url, completed: nil)
                }

            case .failure(let error):
                print("failed to get image url: \(error)")
            }
        })

    }

    
//
//    func configCell(_ data: PostedMD){
//        contentPost.text = data.contentPost
//
//    }

    
}
