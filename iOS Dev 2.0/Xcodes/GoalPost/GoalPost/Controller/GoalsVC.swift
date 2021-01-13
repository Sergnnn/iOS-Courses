//
//  GoalsVC.swift
//  GoalPost
//
//  Created by Сергей Непомящий on 13.01.2021.
//

import UIKit

class GoalsVC: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func addGoalBtnWasPressed(_ sender: Any) {
        print("tapped")
    }
    
}

