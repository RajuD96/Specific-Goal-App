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
        tableView.delegate = self
        tableView.dataSource = self
        tableView.isHidden = false
      
    
    }

   
    @IBAction func addGoalBtnPressed(_ sender: Any) {
        
        print("button was pressed")
    }
    
}

extension GoalsVC:UITableViewDelegate,UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "goalCell") as? GoalCell else {return UITableViewCell() }
   cell.configureCell(description: "code everyday to learn More", type:.LongTerm, progressAmt: 10)
        return cell
    }
    
    
    
    
    
    
    
    
}
