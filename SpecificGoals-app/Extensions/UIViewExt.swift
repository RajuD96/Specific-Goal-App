//
//  UIViewExt.swift
//  SpecificGoals-app
//
//  Created by Raju Dhumne on 17/01/18.
//  Copyright © 2018 Raju Dhumne. All rights reserved.
//

import UIKit

extension UIView {
    
    func bindToKeyBoard() {
        NotificationCenter.default.addObserver(self, selector: #selector(keyBoardChange(_:)), name: NSNotification.Name.UIKeyboardWillChangeFrame, object: nil)
    }
    
    
   @objc func keyBoardChange(_ notif:NSNotification) {
    let duration  = notif.userInfo![UIKeyboardAnimationDurationUserInfoKey] as! Double
    let curve = notif.userInfo![UIKeyboardAnimationCurveUserInfoKey] as! UInt
    let startingFrame = (notif.userInfo![UIKeyboardFrameBeginUserInfoKey] as! NSValue).cgRectValue
    let endFrame = (notif.userInfo![UIKeyboardFrameEndUserInfoKey] as!NSValue).cgRectValue
    let deltaY = endFrame.origin.y - startingFrame.origin.y
    
    UIView.animateKeyframes(withDuration: duration, delay: 0.0, options: UIViewKeyframeAnimationOptions(rawValue: curve), animations: {
        self.frame.origin.y += deltaY
    }, completion: nil)
    }
}
