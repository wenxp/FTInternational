//
//  LanguageViewController.swift
//  SwiftDemo
//
//  Created by wen xiaopei on 2018/1/15.
//  Copyright © 2018年 wenxiaopei. All rights reserved.
//

import UIKit
import SnapKit
import FTInternational

class LanguageViewController: UIViewController {

    lazy var label: UILabel = {
        let label = UILabel()
        label.backgroundColor = UIColor.lightGray
        label.textColor = UIColor.red
        label.font = UIFont.systemFont(ofSize: 18)
        label.text = "International_key"
        return label
    }()

    lazy var button: UIButton = {
        let button = UIButton(type: .custom)
        button.backgroundColor = UIColor.lightGray
        button.setTitle("International_key", for: UIControlState())
        button.setTitleColor(UIColor.red, for: UIControlState())
        button.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        return button
    }()

    lazy var textField: UITextField = {
        let textField = UITextField()
        textField.backgroundColor = UIColor.lightGray
        textField.font = UIFont.systemFont(ofSize: 15)
        textField.textColor = UIColor.red
        textField.placeholder = "International_key"
        return textField
    }()

    var sign = 0


    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.title = "国际化"

        let path  = Bundle.main.path(forResource: "zh-Hans", ofType: "lproj")
//        let path  = Bundle.main.path(forResource: "en", ofType: "lproj")
        FTInternationalConf.languageBundle = Bundle.init(path: path!)
        sign = 1

        // Do any additional setup after loading the view.
        view.addSubview(label)
        view.addSubview(button)
        view.addSubview(textField)

        label.snp.makeConstraints { (make) in
            make.width.equalTo(110)
            make.height.equalTo(20)
            make.left.equalToSuperview().inset(15)
            make.top.equalToSuperview().inset(80)
        }
        button.snp.makeConstraints { (make) in
            make.width.equalTo(110)
            make.height.equalTo(30)
            make.left.equalTo(label.snp.left)
            make.top.equalTo(label.snp.bottom).offset(10)
        }

        textField.snp.makeConstraints { (make) in
            make.width.equalTo(110)
            make.height.equalTo(30)
            make.left.equalTo(label.snp.left)
            make.top.equalTo(button.snp.bottom).offset(10)
        }
    }

    @objc fileprivate func buttonAction() {
        debugPrint("buttonAction")
        if sign == 0 {

            let path  = Bundle.main.path(forResource: "zh-Hans", ofType: "lproj")
            FTInternationalConf.languageBundle = Bundle.init(path: path!)
            sign = 1
        }else {
            let path  = Bundle.main.path(forResource: "en", ofType: "lproj")
            FTInternationalConf.languageBundle = Bundle.init(path: path!)
            sign = 0
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
