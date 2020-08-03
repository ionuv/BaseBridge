//
//  TipHud.swift
//  BaseBridge
//
//  Created by sxh on 2020/7/31.
//  Copyright © 2020 yuxin. All rights reserved.
//

import UIKit
import CoreFoundation
import MBProgressHUD

class TipHud: NSObject {
    
    private var hud: MBProgressHUD?
    
    private static let shareTipHud: TipHud = {
        let shared = TipHud()
        return shared
    }()
    
    open func showMessage(_ message: String) {
        hud?.removeFromSuperview()
        hud = nil
        
        let keyWindow: UIWindow = UIApplication.shared.keyWindow!
        hud = MBProgressHUD()
        
        hud?.mode = .customView
        hud?.bezelView.style = .solidColor
        hud?.bezelView.backgroundColor = .black
        
        let label = UILabel()
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 15.0)
        label.textColor = .white
        
        if message.count > 0 {
            label.text = message
            let size: CGSize = sizeWithString(message, font: .systemFont(ofSize: 15.0))
            label.frame = CGRect(x: 0, y: 0, width: size.width, height: size.height)
            label.textAlignment = .center
            hud?.customView = label
            
            keyWindow.addSubview(hud!)
            hud?.show(animated: true)
            
            DispatchQueue.main.asyncAfter(deadline: DispatchTime(floatLiteral: displayDurationForString(message))) {
                self.hideTips()
            }
        }
        
        print(message)
    }
    
    open func showLoadingOnView(_ view: UIView) {
        if (hud != nil) {
            hud?.removeFromSuperview()
            hud = nil
        }
        
        DispatchQueue.main.async {
            
            self.hud = MBProgressHUD(view: view)
            self.hud?.mode = .customView
            self.hud?.show(animated:  true)
            
            let imageView: UIImageView = UIImageView(frame: .zero)
            imageView.center = self.hud!.center
            let img: UIImage = UIImage.animatedImageNamed("loading", duration: 14*0.075)!

            imageView.image = img
            
            imageView.startAnimating()
            self.hud?.customView = imageView
            self.hud?.backgroundColor = .clear
            self.hud?.bezelView.style = .solidColor
            self.hud?.bezelView.backgroundColor = .clear
            
            view.addSubview(self.hud!)
        }
    }
    
    open func hideTips() {
        DispatchQueue.main.async {
            
            self.hud?.removeFromSuperViewOnHide = true
            self.hud?.hide(animated: true)
            self.hud = nil
        }
    }
    
    open func hideTips(_ delay: TimeInterval) {
        DispatchQueue.main.async {
            
            self.hud?.removeFromSuperViewOnHide = true
            self.hud?.hide(animated: true, afterDelay: delay)
            self.hud = nil
        }
    }
    
    private func sizeWithString(_ str: String, font: UIFont) -> CGSize {
        return str.boundingRect(with: CGSize(width: 200, height: 8000), options: .usesLineFragmentOrigin, attributes: [NSAttributedString.Key.font: font], context: nil).size
    }
    
    private func displayDurationForString(_ str: String) -> Double {
        return min(Double(str.count) * 0.06 + 1, 3.0)
    }
    
    class func shared() -> TipHud {
        return shareTipHud
    }
}

///扩展时间
extension DispatchTime: ExpressibleByIntegerLiteral {
    public init(integerLiteral value: IntegerLiteralType) {
        self = DispatchTime.now() + .seconds(value)
    }
}

extension DispatchTime: ExpressibleByFloatLiteral {
    public init(floatLiteral value: FloatLiteralType) {
        self = DispatchTime.now() + .milliseconds(Int(value * 1000))
    }
}
