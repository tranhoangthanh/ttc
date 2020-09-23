//
//  UIViewExtension.swift
//  TTCTraining
//
//  Created by Bui Tam on 8/3/20.
//  Copyright © 2020 Apple. All rights reserved.
//

import Foundation
import UIKit

extension UIView{
    func setRadius(_ radius: CGFloat = NORMAL_RADIUS) {
        self.layer.cornerRadius = radius
        self.clipsToBounds = true
    }
    
    
    func createShadow(scale: Bool = true, color shadowColor: UIColor = SHADOW_VIEW_COLOR) {
        layer.masksToBounds = false
        layer.shadowColor = shadowColor.cgColor
        layer.shadowOpacity = 0.3
        layer.shadowOffset = CGSize(width: 1, height: 1)
        layer.shadowRadius = 4
        layer.shouldRasterize = true
        layer.rasterizationScale = scale ? UIScreen.main.scale : 1
    }
}
