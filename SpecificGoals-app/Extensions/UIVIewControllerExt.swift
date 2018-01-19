//
//  UIVIewControllerExt.swift
//  SpecificGoals-app
//
//  Created by Raju Dhumne on 17/01/18.
//  Copyright © 2018 Raju Dhumne. All rights reserved.
//

import UIKit

extension UIViewController {
    
    func presentDetails(_ viewContollertoPresent:UIViewController){
        let transition = CATransition()
        transition.duration = 0.3
        transition.type = kCATransitionPush
        transition.subtype = kCATransitionFromRight
        self.view.window?.layer.add(transition, forKey: kCATransition)
        present(viewContollertoPresent, animated: false, completion: nil)
    }
    func presentSecondaryDetail(_ viewControllerToPresent: UIViewController) {
        let transition = CATransition()
        transition.duration = 0.3
        transition.type = kCATransitionPush
        transition.subtype = kCATransitionFromRight
        
        guard let presentedViewController = presentedViewController else { return }
        
        presentedViewController.dismiss(animated: false) {
            self.view.window?.layer.add(transition, forKey: kCATransition)
            self.present(viewControllerToPresent, animated: false, completion: nil)
        }
    }
    func dismissDetails(){
        let transition = CATransition()
        transition.duration = 0.3
        transition.type = kCATransitionPush
        transition.subtype = kCATransitionFade
        self.view.window?.layer.add(transition, forKey: kCATransition)
        dismiss(animated: false, completion: nil)
        
    }
}
