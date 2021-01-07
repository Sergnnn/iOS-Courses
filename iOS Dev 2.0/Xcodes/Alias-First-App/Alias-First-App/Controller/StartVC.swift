//
//  ViewController.swift
//  Alias-First-App
//
//  Created by Сергей Непомящий on 04.01.2021.
//

import UIKit

class StartVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func newGameBtn(_ sender: Any) {
        
        teams = teamsStructure(teamNames:[], teamsCount: 0)
       
    }
    
}

