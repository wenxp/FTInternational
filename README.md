#  FTInternational
基于swift3.2实现的app 国际化功能。
        使用方法：
        仅需要加入如下代码；
            let path  = Bundle.main.path(forResource: "zh-Hans", ofType: "lproj")
            FTInternationalConf.languageBundle = Bundle.init(path: path!)
        就可以简单实现国际化功能。
        当需要切换语言时，更换语言包bundle即可，方便使用。
