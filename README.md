#  FTInternational
基于swift3.2实现的app 国际化功能。
## 使用方法：
    <br>        仅需要加入如下代码；
        <br>        let path  = Bundle.main.path(forResource: "zh-Hans", ofType: "lproj")
        <br>        FTInternationalConf.languageBundle = Bundle.init(path: path!)
    <br>        就可以简单实现国际化功能。
    <br>        当需要切换语言时，更换语言包bundle即可，方便使用。
