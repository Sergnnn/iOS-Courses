//
//  TeamsCell.swift
//  Alias-First-App
//
//  Created by Сергей Непомящий on 03.02.2021.
//

import UIKit

class TeamsCell: UITableViewCell {
    
    @IBOutlet weak var teamNameLbl: UILabel!

    
    func updateCell(team: team) {
        teamNameLbl.text = team.name
       // categoryIsEnable.isHidden = !word.categoryIsEnable
    }
    
    

}
