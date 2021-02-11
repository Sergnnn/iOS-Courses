//
//  MainCell.swift
//  Alias-First-App
//
//  Created by Сергей Непомящий on 09.02.2021.
//

import UIKit

class MainCell: UITableViewCell {

    @IBOutlet weak var teamName: UILabel!
    @IBOutlet weak var teamScore: UILabel!
    
    func updateCell(team: team) {
        
        teamName.font = UIFont(name: "Avenir", size: 18)
        teamName.textColor = #colorLiteral(red: 0.1251712918, green: 0.3118379438, blue: 0.2135035001, alpha: 1)
        teamScore.font = UIFont(name: "Avenir", size: 18)
        teamScore.textColor = #colorLiteral(red: 0.1251712918, green: 0.3118379438, blue: 0.2135035001, alpha: 1)
        
        
        teamName.text = team.name
        teamScore.text = "\(team.score)"
    }

}
