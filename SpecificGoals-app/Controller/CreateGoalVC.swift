//
//  CreateGoalVC.swift
//  SpecificGoals-app
//
//  Created by Raju Dhumne on 14/01/18.
//  Copyright © 2018 Raju Dhumne. All rights reserved.
//

import UIKit

class CreateGoalVC: UIViewController,UITextViewDelegate {
    //Outlets
    @IBOutlet weak var goalTxtView: UITextView!
    @IBOutlet weak var shortTermBtn: UIButton!
    @IBOutlet weak var nextBtn: UIButton!
    @IBOutlet weak var longTermBtn: UIButton!
    
    //Variable
    var goalType:GoalType = .ShortTerm
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nextBtn.bindToKeyBoard()
        shortTermBtn.selectedColor()
        longTermBtn.deSelectedColor()
        goalTxtView.delegate = self
    }

    @IBAction func longTermPressed(_ sender: Any) {
        goalType = .LongTerm
        longTermBtn.selectedColor()
        shortTermBtn.deSelectedColor()
        
    }
    @IBAction func shortTermBtnPressed(_ sender: Any) {
        goalType = .ShortTerm
        shortTermBtn.selectedColor()
        longTermBtn.deSelectedColor()
    }
    
    @IBAction func backBtnWasPressed(_ sender: Any) {
      dismissDetails()
    }
    
    
    @IBAction func nextBtnWasPressed(_ sender: Any) {
        
        if goalTxtView.text != "" && goalTxtView.text != "What is your Goal?" {
            guard let finishGoalVC = storyboard?.instantiateViewController(withIdentifier: "FinsihGoalVC") as? FinishGoalVC else {return}
            finishGoalVC.intiData(descritpion: goalTxtView.text!, goalType: goalType)
            presentingViewController?.presentSecondaryDetail(finishGoalVC)
        }
        
    }
    func textViewDidBeginEditing(_ textView: UITextView) {
        goalTxtView.text = ""
        goalTxtView.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
    }
    
    
    
    

}
