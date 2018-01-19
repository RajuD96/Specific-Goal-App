//
//  FinishGoalVC.swift
//  SpecificGoals-app
//
//  Created by Raju Dhumne on 17/01/18.
//  Copyright © 2018 Raju Dhumne. All rights reserved.
//

import UIKit
import CoreData

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
        if pointsTxt.text != "" {
            save { (complete) in
                if complete {
                    dismiss(animated: true, completion: nil)
                }
            }
        }
    }
    
    @IBAction func backBtnWasPressed(_ sender: Any) {
        dismissDetails()
    }
    func save(completion:(_ finished:Bool)-> ()) {
        //Save Data to CoreData
        guard let managedContext = appDelegate?.persistentContainer.viewContext else { return }
        let goal = Goal(context: managedContext)
        goal.goalDescription = goalDescription
        goal.goalType = goalType.rawValue
        goal.goalCompletionValue = Int32(pointsTxt.text!)!
        goal.goalProgress = Int32(0)
        
        do {
            try  managedContext.save()
            completion(true)
            print("Successfully Saved to CoreData")
        }catch {
            debugPrint("Could Not Save\(error)")
            completion(false)
        }
        
    }
}
