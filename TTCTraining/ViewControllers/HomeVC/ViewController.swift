//
//  ViewController.swift
//  TTCTraining
//
//  Created by Apple on 10/23/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import UIKit
import FirebaseAuth
import CenteredCollectionView
class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, UITableViewDataSource, UITableViewDelegate {


    let cellPercentWidth: CGFloat = 0.8
    
    // A reference to the `CenteredCollectionViewFlowLayout`.
    // Must be aquired from the IBOutlet collectionView.
    var centeredCollectionViewFlowLayout: CenteredCollectionViewFlowLayout!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var btnFind: UIButton!
    @IBOutlet weak var btnPost: UIButton!
    @IBAction func btnPostLogin(_ sender: Any) {
        let loginVC = storyboard?.instantiateViewController(withIdentifier: "Login") as! LoginViewController
        loginVC.modalPresentationStyle = .fullScreen
        self.present(loginVC, animated: true, completion: nil)
        
            }
    @IBOutlet weak var addFriendCollectionView: UICollectionView!
    @IBOutlet weak var collectionView: UICollectionView!
    var listInfo:[Info] = [];
    var listDiscovery = ["Danh Lam Thắng Cảnh", "Di Tích Lịch Sử", "Địa Điểm Ăn Uống"]
    @IBOutlet weak var tableHeightLayout: NSLayoutConstraint!
    
    @IBOutlet weak var mainView: UIView!
    @IBOutlet weak var viewHeightLayout: NSLayoutConstraint!
    override func viewWillLayoutSubviews() {
        super.updateViewConstraints()
        self.tableHeightLayout?.constant = self.tableView.contentSize.height
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        self.viewWillLayoutSubviews()
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        collectionView.delegate = self
        addFriendCollectionView.delegate = self
        tableView.delegate = self
        
        collectionView.dataSource = self
        addFriendCollectionView.dataSource = self
        tableView.dataSource = self
        btnFind.cornerRadius(5)
        btnPost.cornerRadius(5)

        self.tableView.reloadData()
        self.tableView.layoutIfNeeded()
            
        listInfo = Info.initInfo()
        let nib = UINib.init(nibName: "BannerCollectionViewCell", bundle: nil)
        self.collectionView.register(nib, forCellWithReuseIdentifier: "Cell")
        
        let nibAddFriend = UINib.init(nibName: "AddFriendCollectionViewCell", bundle: nil)
        self.addFriendCollectionView.register(nibAddFriend, forCellWithReuseIdentifier: "Cell")
        
        let nibHomeTableView = UINib.init(nibName: "HomeTableViewCell", bundle: nil)
        self.tableView.register(nibHomeTableView, forCellReuseIdentifier: "Cell")
       
        
        centeredCollectionViewFlowLayout = collectionView.collectionViewLayout as? CenteredCollectionViewFlowLayout
        
        // Modify the collectionView's decelerationRate (REQUIRED STEP)
        collectionView.decelerationRate = UIScrollView.DecelerationRate.fast
        
        // Assign delegate and data source
        collectionView.delegate = self
        collectionView.dataSource = self
        
        // Configure the required item size (REQUIRED STEP)
        centeredCollectionViewFlowLayout.itemSize = CGSize(
            width: 380,
            height: 250
        )

    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        validateAuth()
    }

    private func validateAuth() {
        if FirebaseAuth.Auth.auth().currentUser == nil {
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let loginVC = storyboard.instantiateViewController(withIdentifier: "Login") as! LoginViewController
            loginVC.modalPresentationStyle = .fullScreen
            present(loginVC, animated: false)
        }
    }
    
    
    //Collection View
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return listInfo.count
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == self.collectionView {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! BannerCollectionViewCell
            cell.configCell(listInfo[indexPath.row])
            return cell
        }
            
        else {
            let cellAddFriend = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! AddFriendCollectionViewCell
            cellAddFriend.configCell(listInfo[indexPath.row])
            return cellAddFriend
        }
    }
    
    //Table View
    func numberOfSections(in tableView: UITableView) -> Int {
        return listDiscovery.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return listDiscovery[section]
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listInfo.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! HomeTableViewCell
        cell.configCell(listInfo[indexPath.row])
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 300
    }
}

extension UIView {
    func cornerRadius(_ radius: CGFloat) {
        self.layer.cornerRadius = radius
        self.clipsToBounds = true
    }
}
