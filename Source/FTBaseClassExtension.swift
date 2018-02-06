//
//  FTBaseClassExtension.swift
//  SwiftDemo
//
//  Created by wen xiaopei on 2018/1/16.
//  Copyright © 2018年 wenxiaopei. All rights reserved.
//基类扩展

import UIKit

extension String {
    //获取国际化语言
    public var localizable: String{
        get {
            return FTLanguageInternational.localString(self)
        }
    }

}

extension UILabel {

    struct RuntimeKey {
        static let languageKey = UnsafeRawPointer.init(bitPattern: "international_key".hashValue)
    }

    var internationalKey:String? {
        set {
            objc_setAssociatedObject(self, RuntimeKey.languageKey, newValue, .OBJC_ASSOCIATION_COPY_NONATOMIC)
        }

        get {
            return objc_getAssociatedObject(self, RuntimeKey.languageKey) as? String
        }
    }


//    open override class func initialize() {
//
//        if self == UILabel.self {
//
//            let originalSelector = #selector(setter: UILabel.text)
//            let swizzledSelector = #selector(UILabel.ft_setText(_:))
//
//            let originalMethod = class_getInstanceMethod(self, originalSelector)
//            let swizzledMethod = class_getInstanceMethod(self, swizzledSelector)
//
//            let didAddMethod = class_addMethod(self, originalSelector, method_getImplementation(swizzledMethod), method_getTypeEncoding(swizzledMethod))
//
//            if didAddMethod {
//                class_replaceMethod(self, swizzledSelector, method_getImplementation(originalMethod), method_getTypeEncoding(originalMethod))
//            } else {
//                method_exchangeImplementations(originalMethod, swizzledMethod);
//            }
//        }
//    }

    public override class func initializeOnceMethod() {
        if self == UILabel.self {

            let originalSelector = #selector(setter: UILabel.text)
            let swizzledSelector = #selector(UILabel.ft_setText(_:))

            let originalMethod = class_getInstanceMethod(self, originalSelector)
            let swizzledMethod = class_getInstanceMethod(self, swizzledSelector)

            let didAddMethod = class_addMethod(self, originalSelector, method_getImplementation(swizzledMethod), method_getTypeEncoding(swizzledMethod))

            if didAddMethod {
                class_replaceMethod(self, swizzledSelector, method_getImplementation(originalMethod), method_getTypeEncoding(originalMethod))
            } else {
                method_exchangeImplementations(originalMethod, swizzledMethod);
            }
        }
    }

    @objc fileprivate func ft_setText(_ sText: String?) {
        self.internationalKey = sText
        self.ft_setText(sText?.localizable)
    }
}

