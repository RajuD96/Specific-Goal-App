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
    
    @IBOutlet weak var completionView: UIView!
    func configureCell(goal:Goal){
        self.goalDescLbl.text = goal.goalDescription
        self.goalTypeLbl.text = goal.goalType
        self.progessLbl.text = String(describing: goal.goalProgress)
        if goal.goalProgress == goal.goalCompletionValue {
            completionView.isHidden = false
        }else {
            completionView.isHidden = true
        }
    }

}
