//
//  FTLanguageInternational.swift
//  SwiftDemo
//
//  Created by wen xiaopei on 2018/1/15.
//  Copyright © 2018年 wenxiaopei. All rights reserved.
//

import UIKit

class FTLanguageInternational {

    //通过key获取多语言值
    static func localString(_ key: String?) -> String {

        guard let mKey = key else { return "" }
        if let bundle = FTInternationalConf.languageBundle {
            return bundle.localizedString(forKey: mKey, value: nil, table: "Localizable")
        }
        return mKey
    }

}
