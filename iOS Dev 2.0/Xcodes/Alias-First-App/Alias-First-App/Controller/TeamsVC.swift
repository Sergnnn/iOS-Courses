//
//  TeamsVC.swift
//  Alias-First-App
//
//  Created by Сергей Непомящий on 04.01.2021.
//

import UIKit

let appDelegate = UIApplication.shared.delegate as? AppDelegate

class TeamsVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
   
    @IBOutlet weak var plusBtn: UIButton!
    @IBOutlet weak var teamsTable: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        teamsTable.delegate = self
        teamsTable.dataSource = self
        teamsTable.rowHeight = 60
        teamsTable.isScrollEnabled = false
        teamsTable.backgroundColor = nil
        
    }
    
    func removeTeam(indexPath: IndexPath){
        teams.remove(at: indexPath.row)
        print(teams)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return teams.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "TeamsCell") as? TeamsCell {
            cell.backgroundColor = #colorLiteral(red: 0.9529411793, green: 0.6862745285, blue: 0.1333333403, alpha: 1)
            cell.updateCell(team: teams[indexPath.row])
            
            return cell
        }
        return UITableViewCell()
    }
    
  
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
      
        if teams.count > 2 {
        
            let contextItem = UIContextualAction(style: .destructive, title: "Delete") {  (contextualAction, view, boolValue) in
                self.removeTeam(indexPath: indexPath)
                tableView.deleteRows(at: [indexPath], with: .automatic)
            }
            
            contextItem.backgroundColor = #colorLiteral(red: 0.7450980544, green: 0.1568627506, blue: 0.07450980693, alpha: 1)
            let swipeActions = UISwipeActionsConfiguration(actions: [contextItem])
            return swipeActions
        }
        return nil
    }
  

    @IBAction func plusBtnTapped(_ sender: Any) {
        addTeam()
        teamsTable.reloadData()
        print(teams)
    }
    
}
