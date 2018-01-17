//
//  UIButtonExt.swift
//  SpecificGoals-app
//
//  Created by Raju Dhumne on 17/01/18.
//  Copyright © 2018 Raju Dhumne. All rights reserved.
//

import UIKit

extension UIButton {
    
    func selectedColor() {
        self.backgroundColor = #colorLiteral(red: 0, green: 0.5898008943, blue: 1, alpha: 1)
    }
    func deSelectedColor() {
        self.backgroundColor = #colorLiteral(red: 0.7661477923, green: 0.9182959199, blue: 0.9841541648, alpha: 0.87)
        
    }
}
