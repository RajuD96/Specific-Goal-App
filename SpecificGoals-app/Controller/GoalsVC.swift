//
//  ViewController.swift
//  SpecificGoals-app
//
//  Created by Raju Dhumne on 12/01/18.
//  Copyright © 2018 Raju Dhumne. All rights reserved.
//

import UIKit

class GoalsVC: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

   
    @IBAction func addGoalBtnPressed(_ sender: Any) {
        
        print("button was pressed")
    }
    
}

