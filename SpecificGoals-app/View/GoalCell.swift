//
//  GoalCell.swift
//  SpecificGoals-app
//
//  Created by Raju Dhumne on 12/01/18.
//  Copyright © 2018 Raju Dhumne. All rights reserved.
//

import UIKit

class GoalCell: UITableViewCell {
    //Outlets
    @IBOutlet weak var goalDescLbl: UILabel!
    @IBOutlet weak var goalTypeLbl: UILabel!
    @IBOutlet weak var progessLbl: UILabel!
    
    func configureCell(description:String,type:GoalType,progressAmt:Int){
        self.goalDescLbl.text = description
        self.goalTypeLbl.text = type.rawValue
        self.progessLbl.text = String(describing: progressAmt)

    }

}
