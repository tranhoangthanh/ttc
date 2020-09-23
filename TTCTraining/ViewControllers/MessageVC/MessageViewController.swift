//
//  MessageViewController.swift
//  TTCTraining
//
//  Created by Apple on 10/23/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import UIKit

class MessageViewController: UIViewController{

    static var index:Int = 0
    @IBOutlet weak var contentView: UIView!
    
    @IBOutlet weak var segmentControl: UISegmentedControl!
    
    var controller: MessagePageView?
    @IBAction func segment(_ sender: Any) {
        controller?.didChangePage(segmentControl.selectedSegmentIndex)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        controller = storyboard!.instantiateViewController(withIdentifier: "MessagePageView") as! MessagePageView
        addChild(controller!)
        contentView.addSubview(controller!.view)
        controller!.didMove(toParent: self)
        
    }
}

