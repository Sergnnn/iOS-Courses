//
//  ReusltsTeamsCell.swift
//  Alias-First-App
//
//  Created by Сергей Непомящий on 12.02.2021.
//

import UIKit

class ResultsTeamsCell: UITableViewCell {

    @IBOutlet weak var teamName: UILabel!
    @IBOutlet weak var score: UILabel!
        
    func updateCell(result: result) {
        teamName.text = result.team
        score.text = "\(result.score)"
    }


}
