//
//  WordsVC.swift
//  Alias-First-App
//
//  Created by Сергей Непомящий on 08.01.2021.
//

import UIKit



class WordsVC: UIViewController {
    
    @IBOutlet weak var stack: UIStackView!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func onBtn_Create(_ sender: Any) {
        addTeam()
        createButton(teams.teamNames[teams.teamsCount - 1 ])
        
        print(teams.teamsCount)
    }

    func createButton(_ title: String) {
        
        let button = CustomTeamsButton()
        button.CustomTeamsButton()
        button.setTitle(title, for: .normal)
        button.titleLabel?.font = UIFont(name: "Avenir", size: 20)
        NSLayoutConstraint.activate([button.heightAnchor.constraint(equalToConstant: 60)])
        //button.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)

        stack.addArrangedSubview(button)
    }
    
}
