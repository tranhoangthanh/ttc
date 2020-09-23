//
//  SettingMD.swift
//  TTCTraining
//
//  Created by Bui Tam on 8/11/20.
//  Copyright © 2020 Apple. All rights reserved.
//

import Foundation
import UIKit
class SettingMD: NSObject{
    var imgSettingURL: String?
    var desSetting: String?
    init(imgSettingURL: String?, desSetting: String?) {
        self.imgSettingURL = imgSettingURL
        self.desSetting = desSetting
    }
    
    func clone() -> SettingMD{
        return SettingMD(imgSettingURL: self.imgSettingURL, desSetting: self.desSetting)
    }
    static func initSetting() -> [[SettingMD]]{
        return [[SettingMD(imgSettingURL: "suli", desSetting: "Manage my account"),
                SettingMD(imgSettingURL: "suli", desSetting: "Privacy and safety"),
                SettingMD(imgSettingURL: "suli", desSetting: "Security"),
                SettingMD(imgSettingURL: "suli", desSetting: "Balance"),
                SettingMD(imgSettingURL: "suli", desSetting: "Content preferences"),
                SettingMD(imgSettingURL: "suli", desSetting: "Share profile")],

                [SettingMD(imgSettingURL: "suli", desSetting: "Push notification"),
                SettingMD(imgSettingURL: "suli", desSetting: "Language"),
                SettingMD(imgSettingURL: "suli", desSetting: "Accessibility"),
                SettingMD(imgSettingURL: "suli", desSetting: "Data Saver"),
            ],

                [SettingMD(imgSettingURL: "suli", desSetting: "Report a problem"),
                SettingMD(imgSettingURL: "suli", desSetting: "Help Center"),
                SettingMD(imgSettingURL: "suli", desSetting: "Safety Center")],

                [SettingMD(imgSettingURL: "suli", desSetting: "Term of Use"),
                SettingMD(imgSettingURL: "suli", desSetting: "Community Guidelines"),
                SettingMD(imgSettingURL: "suli", desSetting: "Privacy Policy"),
                SettingMD(imgSettingURL: "suli", desSetting: "Copyright Policy"),
                SettingMD(imgSettingURL: "suli", desSetting: "Add account"),
                SettingMD(imgSettingURL: "suli", desSetting: "Log out"),
            ]
                                                                               
                                                                               
        ]
    }
}
