//
//  JsApiTest.swift
//  JS-Demo
//
//  Created by sxh on 2020/7/13.
//  Copyright © 2020 yuxin. All rights reserved.
//

import UIKit
typealias JSCallBack = (String,Bool) -> Void

class JsApiTest: NSObject {

    //    同步方法
    @objc func sync(_ arg: String) {
        let dict = NSDictionary(dictionary: ["name":"张三","age":"18","sex":"male"])
        let alert = UIAlertController(title: "提示", message: String(format: "%@", dict), preferredStyle: .alert)
        let ok = UIAlertAction(title: "确定", style: .default, handler: nil)
        let can = UIAlertAction(title: arg, style: .cancel, handler: nil)
        alert.addAction(ok)
        alert.addAction(can)
        let viewController = UIApplication.shared.keyWindow?.rootViewController
        viewController?.present(alert, animated: true, completion: nil)
    }
    
    // 异步方法
    @objc func Async(_ arg: String, handler: JSCallBack) {
        let dict = NSDictionary(dictionary: ["name":"张三","age":"18","sex":"male"])
//        let alert = UIAlertController(title: "张三", message: "18", preferredStyle: .alert)
//        let viewController = UIApplication.shared.keyWindow?.rootViewController
//        viewController?.present(alert, animated: true, completion: nil)
        handler(String(format: "[hiahiahia??? async:%@]----%@", arg, dict),true)
    }
    
    @objc func alert(_ arg: String) {
//        TipHud.shared().showMessage("12312")
        TipHud.shared().showLoadingOnView(UIApplication.shared.keyWindow!)
        TipHud.shared().hideTips(2)
    }
    
    @objc func startLoading(_ arg: String) {
        TipHud.shared().showLoadingOnView(UIApplication.shared.keyWindow!)
    }
    
    @objc func stopLoading(_ arg: String) {
        TipHud.shared().hideTips()
    }
}
