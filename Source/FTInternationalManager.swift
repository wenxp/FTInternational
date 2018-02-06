//
//  FTInternationalManager.swift
//  SwiftDemo
//
//  Created by wen xiaopei on 2018/1/15.
//  Copyright © 2018年 wenxiaopei. All rights reserved.
//

import UIKit

public let FTInternationalConf = FTInternationalManager.shared

open class FTInternationalManager {
    //单例
    open static var shared = FTInternationalManager()
    //系统或app语言环境
    open var languageEnv = Locale.preferredLanguages.first

    //语言包
    open var languageBundle: Bundle? {
        didSet {
            NotificationCenter.default.post(name: NSNotification.Name(rawValue: "ft_changeLanguage"), object: nil)
        }
    }

    init() {
        UILabel.initializeOnceMethod()
    }

}
