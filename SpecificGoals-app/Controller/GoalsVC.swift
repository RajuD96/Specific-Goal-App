//
//  ViewController.swift
//  SpecificGoals-app
//
//  Created by Raju Dhumne on 12/01/18.
//  Copyright © 2018 Raju Dhumne. All rights reserved.
//

import UIKit
import CoreData

let appDelegate = UIApplication.shared.delegate as? AppDelegate
class GoalsVC: UIViewController {
    
    //Outlets
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var showUndoView: UIView!
    @IBOutlet weak var undoBtn: UIButton!
    
    var goals:[Goal] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.isHidden = false
        showUndoView.alpha = 0.0
        undoBtn.isHidden = true
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        fetchCoreDataObject()
        tableView.reloadData()
    }
    
    func fetchCoreDataObject () {
        self.fetch { (complete) in
            if complete {
                if goals.count >= 1 {
                    tableView.isHidden = false
                }else {
                    tableView.isHidden = true
                }
            }
        }
    }
    
    @IBAction func addGoalBtnPressed(_ sender: Any) {
        guard let createGoalVC = storyboard?.instantiateViewController(withIdentifier: "CreateGoalVC") else {return}
        presentDetails(createGoalVC)
        
    }
    
    @IBAction func undoBtnWasPressed(_ sender: Any) {
        showUndoView.alpha = 0.0
        guard let contextManager =
            appDelegate?.persistentContainer.viewContext else { return }
        contextManager.undoManager?.undo()
        fetchCoreDataObject()
        tableView.reloadData()
        
        print("Btn was pressed")
    }
}

extension GoalsVC:UITableViewDelegate,UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return goals.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "goalCell") as? GoalCell else {return UITableViewCell() }
        let goal = goals[indexPath.row]
        cell.configureCell(goal: goal)
        return cell
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCellEditingStyle {
        return .none
    }
    
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        let deleteAction = UITableViewRowAction(style: .destructive, title: "DELETE") { (rowAction, indexPath) in
            self.removeGoal(atIndexPath: indexPath)
            self.fetchCoreDataObject()
            tableView.deleteRows(at: [indexPath], with: .automatic)
        }
        
        let addAction = UITableViewRowAction(style: .normal, title: "ADD 1") { (rowAction, indexpath) in
            self.setProgress(atIndexPath: indexPath)
            tableView.reloadRows(at: [indexPath], with: .automatic)
        }
        deleteAction.backgroundColor = #colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1)
        addAction.backgroundColor = #colorLiteral(red: 0, green: 0.5898008943, blue: 1, alpha: 1)
        
        return [deleteAction,addAction]
    }
}

extension GoalsVC {
    
    func fetch (completion: (_ complete:Bool) ->()) {
        guard let managedContext = appDelegate?.persistentContainer.viewContext else { return }
        let fetchReq = NSFetchRequest<Goal>(entityName: "Goal")
        do{
            goals =  try managedContext.fetch(fetchReq) 
            completion(true)
        }
        catch{
            debugPrint("\(error.localizedDescription)")
            completion(false)
        }
    }
    
    func removeGoal(atIndexPath indexPath:IndexPath){
        guard let managedContext = appDelegate?.persistentContainer.viewContext else { return }
        managedContext.undoManager = UndoManager()
        managedContext.delete(goals[indexPath.row])
        do {
            try managedContext.save()
            undoBtn.isHidden = false
            fadeInView(view: showUndoView)
            fadeOutView(view: showUndoView)
        }catch{
            debugPrint("\(error.localizedDescription)")
        }
        
    }
    
    func setProgress(atIndexPath indexPath:IndexPath) {
        guard let managedContext = appDelegate?.persistentContainer.viewContext else { return }
        
        let selectedRow = goals[indexPath.row]
        
        if selectedRow.goalProgress < selectedRow.goalCompletionValue {
            selectedRow.goalProgress = selectedRow.goalProgress + 1
        }else {
            return
        }
        
        do {
            try managedContext.save()
        }catch{
            debugPrint("\(error)")
        }
    }
    
    func fadeOutView(view: UIView) {
        UIView.animate(withDuration: 1.0, delay: 1.5, options: .curveEaseOut, animations: {
            view.alpha = 0.0
        }, completion: { (true) in
            self.undoBtn.isHidden = true
        })
    }
    func fadeInView(view: UIView) {
        UIView.animate(withDuration: 3.0) {
            view.alpha = 1.0
        }
    }
}
