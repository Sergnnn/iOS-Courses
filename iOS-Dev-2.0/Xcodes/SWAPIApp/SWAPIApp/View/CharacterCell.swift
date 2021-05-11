//
//  CharacterCell.swift
//  SWAPIApp
//
//  Created by Сергей Непомящий on 30.01.2021.
//

import UIKit

class CharacterCell: UITableViewCell {

    @IBOutlet weak var characterLbl: UILabel!
    
    
    
    func updatecell(resuls: result) {
        characterLbl.text = resuls.name
    }
    
}
