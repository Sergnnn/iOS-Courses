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
        teamName.textColor = .white
        teamScore.font = UIFont(name: "Avenir", size: 18)
        teamScore.textColor = .white
        
        
        teamName.text = team.name
        teamScore.text = "\(team.score)"
    }

}
