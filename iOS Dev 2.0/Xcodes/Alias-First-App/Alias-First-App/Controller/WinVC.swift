//
//  WinVC.swift
//  Alias-First-App
//
//  Created by Сергей Непомящий on 16.02.2021.
//

import UIKit

class WinVC: UIViewController {

    @IBOutlet weak var teamName: CustomWinnerLabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        teamName.text = "\(teams[teamNumber].name)"
        
    }
    

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        teams = [team]()
        addTeam()
        addTeam()
    }

}
