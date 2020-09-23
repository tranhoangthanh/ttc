//
//  AboutMeViewController.swift
//  TTCTraining
//
//  Created by Bui Tam on 8/9/20.
//  Copyright © 2020 Apple. All rights reserved.
//

import UIKit
import FirebaseAuth
import FBSDKLoginKit
import GoogleSignIn
import SDWebImage
class AboutMeViewController: UIViewController {
    var lstPost = PostedMD.initPost()
    private var posts = [PostModel]()
    @IBOutlet weak var profileImg: UIImageView!
    @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var postedTableView: UITableView!
    @IBOutlet weak var postTableViewHeight: NSLayoutConstraint!
    @IBAction func createPostGestureAction(_ sender: Any) {
        let createPostVC = CreatePostVC(nibName: "CreatePostVC", bundle: nil)
        createPostVC.modalPresentationStyle = .fullScreen
        self.present(createPostVC, animated: true, completion: nil)
    }
    @IBAction func btnEditProfileAction(_ sender: Any) {
        let editProfileVC = EditProfileVC(nibName: "EditProfileVC", bundle: nil)
        editProfileVC.modalPresentationStyle = .fullScreen
        createAnimated(self: self)
        self.present(editProfileVC, animated: false, completion: nil)
    }
    @IBAction func btnSettingAction(_ sender: Any) {
        let settingVC = SettingVC(nibName: "SettingVC", bundle: nil)
        settingVC.modalPresentationStyle = .fullScreen
        createAnimated(self: self)
        self.present(settingVC, animated: false, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initUI()
        startListenningForPost()
    }
    

    func initUI(){
        postedTableView.delegate = self
        postedTableView.dataSource = self
        postedTableView.register(UINib(nibName: "PostedTBVCell", bundle: nil), forCellReuseIdentifier: "PostedTBVCell")
//
        setImageProfile(profileImage: profileImage)
        setImageProfile(profileImage: profileImg)
        userName.text = UserDefaults.standard.value(forKey: "name") as? String
    }
    private func startListenningForPost (){
        guard let email = UserDefaults.standard.value(forKey: "email") as? String else {
            return
        }
        let safeEmail = DatabaseManager.safeEmail(emailAddress: email)
        DatabaseManager.shared.getAllPosts(with: safeEmail, completion: {[weak self] result in
            switch result {
            case .success(let posts):
                guard !posts.isEmpty else {
                    return
                }
               
                DispatchQueue.main.async {
                    self?.posts = posts
                    self?.postTableViewHeight.constant = CGFloat(posts.count * 500)
                    print("post 2: \(posts)")
                    self?.postedTableView.reloadData()
                }
            case .failure(let error):
                print("fail to get conversation", error)
            }
        })
    }
}

// MARK: - TableViewDelegates and datasources
extension AboutMeViewController: UITableViewDelegate, UITableViewDataSource{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print("Total post: \(posts.count)")
        return posts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PostedTBVCell", for: indexPath) as! PostedTBVCell
        cell.configCell(posts[indexPath.row])
        print("Cell for row: \(posts[indexPath.row])")
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
}

