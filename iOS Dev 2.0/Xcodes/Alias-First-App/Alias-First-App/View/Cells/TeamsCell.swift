//
//  TeamsCell.swift
//  Alias-First-App
//
//  Created by Сергей Непомящий on 03.02.2021.
//

import UIKit

class TeamsCell: UITableViewCell {
    
    @IBOutlet weak var teamNameLbl: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        cellDesign()
    }
    
    func cellDesign() {
        layer.cornerRadius = 0
        layer.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0.2)
    }
    
    func updateCell(team: team) {
        teamNameLbl.text = team.name
    }
    
    
    
}
