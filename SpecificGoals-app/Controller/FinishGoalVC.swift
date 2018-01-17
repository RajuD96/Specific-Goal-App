//
//  FinishGoalVC.swift
//  SpecificGoals-app
//
//  Created by Raju Dhumne on 17/01/18.
//  Copyright © 2018 Raju Dhumne. All rights reserved.
//

import UIKit

class FinishGoalVC: UIViewController,UITextFieldDelegate{

    @IBOutlet weak var pointsTxt: UITextField!
    @IBOutlet weak var createGoalBtn: UIButton!
    var goalDescription:String!
    var goalType:GoalType!
    
    func intiData(descritpion:String,goalType:GoalType){
        self.goalDescription = descritpion
        self.goalType = goalType
    }
    override func viewDidLoad() {
        super.viewDidLoad()
     createGoalBtn.bindToKeyBoard()
        pointsTxt.delegate = self
    }

 
    @IBAction func createGoalBtnWasPressed(_ sender: Any) {
        
        
    }
    
}
