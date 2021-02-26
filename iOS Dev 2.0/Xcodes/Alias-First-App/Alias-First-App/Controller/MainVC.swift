//
//  MainVC.swift
//  Alias-First-App
//
//  Created by Сергей Непомящий on 09.02.2021.
//

import UIKit

class MainVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
       

    @IBOutlet weak var scoreToAchive: CustomTitleLable!
    @IBOutlet weak var teamsTable: UITableView!
    @IBOutlet weak var roundNumber: CustomTitleLable!
    @IBOutlet weak var teamOnTurnName: CustomTitleLable!
    @IBOutlet weak var viewForTable: UIView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        teamsTable.delegate = self
        teamsTable.dataSource = self
        teamsTable.isScrollEnabled = false
        teamsTable.separatorStyle = .none
        teamsTable.backgroundColor = nil
        
        addTableHeightConstrain()
        teamsTable.rowHeight = 50
        
        scoreToAchive.text = "\(rules.amountOfWords)"
        roundNumber.text = "Раунд \(roundCounter)"
        teamOnTurnName.text = "\(teams[teamNumber].name)"
        
        
        
        debugPrint(teams)

    }
    

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return teams.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "MainCell") as? MainCell {
            let teamsForMainVC = teams.sorted(by: {$0.score > $1.score })
            cell.backgroundColor = UIColor.clear
            cell.updateCell(team: teamsForMainVC[indexPath.row])
            cell.selectionStyle = .none
            return cell
        }
        return UITableViewCell()
    }
    
    func addTableHeightConstrain() {
        viewForTable.addConstraint(viewForTable.heightAnchor.constraint(equalToConstant: CGFloat(teams.count * 50)))
    }

}
