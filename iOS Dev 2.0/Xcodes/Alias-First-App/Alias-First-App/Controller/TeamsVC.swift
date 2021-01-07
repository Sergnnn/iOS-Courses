//
//  TeamsVC.swift
//  Alias-First-App
//
//  Created by Сергей Непомящий on 04.01.2021.
//

import UIKit

class TeamsVC: UIViewController {

    @IBOutlet weak var stack: UIStackView!
    @IBOutlet weak var Team1Btn: CustomTeamsButton!
    @IBOutlet weak var Team2Btn: CustomTeamsButton!
    @IBOutlet weak var plusBtn: UIButton!
    @IBOutlet weak var minusBtn: UIButton!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
// Do any additional setup after loading the view.
        
        addTeam()
        addTeam()
        
        Team1Btn.setTitle(teams.teamNames[0], for: .normal)
        Team2Btn.setTitle(teams.teamNames[1], for: .normal)
        
        minusBtn.isHidden = true
    }
    
    
  
    @IBAction func onBtn_Create(_ sender: Any) {
        addTeam()
        createButton(teams.teamNames[teams.teamsCount - 1 ])
        
        if teams.teamsCount == 5 {
            plusBtn.isHidden = true
        }
        if teams.teamsCount > 2 {
            minusBtn.isHidden = false
        }
        
        print(teams.teamsCount)
    }
    
    @IBAction func onBtn_Delete(_ sender: Any) {
        if let v = stack.arrangedSubviews.last {
            stack.removeArrangedSubview(v)
            v.removeFromSuperview()
         
            deleteLastTeam()
            
            if teams.teamsCount < 5 {
                plusBtn.isHidden = false
            }
            if teams.teamsCount == 2 {
                minusBtn.isHidden = true
            }
            
            print(teams.teamsCount)
        }
    }
    
        func createButton(_ title: String) {
            
            let button = CustomTeamsButton()
            button.CustomTeamsButton()
            button.setTitle(title, for: .normal)
            button.titleLabel?.font = UIFont(name: "Avenir", size: 20)
            NSLayoutConstraint.activate([button.heightAnchor.constraint(equalToConstant: 60)])
            button.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)

            stack.addArrangedSubview(button)
        }

    @objc func buttonAction(sender: UIButton!) {
            print("Button tapped")
        }
        
    
    

   




}
