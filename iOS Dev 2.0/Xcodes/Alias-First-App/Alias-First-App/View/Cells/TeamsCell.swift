//
//  TeamsCell.swift
//  Alias-First-App
//
//  Created by Сергей Непомящий on 03.02.2021.
//

import UIKit

protocol TeamsCellDelegate {
    func deleteCell()
}

class TeamsCell: UITableViewCell {
    
    @IBOutlet weak var teamNameLbl: UILabel!
    @IBOutlet weak var deleteButton: UIButton!
    var teamsCellDelegate: TeamsCellDelegate?
    
    func updateCell(team: team) {
        teamNameLbl.text = team.name
    }
    
    
    @IBAction func deleteButtonTapped(_ sender: Any) {
        findAndDeleteTeam()
        teamsCellDelegate?.deleteCell()
    }
    
    
    func findAndDeleteTeam() {
        for i in 0...teams.count - 1 {
            if teams[i].name == teamNameLbl.text {
                teams.remove(at: i)
                break
            }
        }
    }

    func deleteButtonShowHide(){
        if teams.count < 3 {deleteButton.isHidden = true}
        if teams.count > 2 {deleteButton.isHidden = false}
    }
    
}
