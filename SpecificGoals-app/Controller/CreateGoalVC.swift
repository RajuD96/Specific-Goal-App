//
//  CreateGoalVC.swift
//  SpecificGoals-app
//
//  Created by Raju Dhumne on 14/01/18.
//  Copyright © 2018 Raju Dhumne. All rights reserved.
//

import UIKit

class CreateGoalVC: UIViewController {

    
    @IBOutlet weak var goalTxtView: UITextView!
    @IBOutlet weak var shortTermBtn: UIButton!
    @IBOutlet weak var nextBtn: UIButton!
    @IBOutlet weak var longTermBtn: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func longTermPressed(_ sender: Any) {
    }
    @IBAction func shortTermBtnPressed(_ sender: Any) {
    }
    
    @IBAction func backBtnWasPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    
    @IBAction func nextBtnWasPressed(_ sender: Any) {
    }
    
    
    
    
    

}
