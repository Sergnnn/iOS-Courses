//
//  TeamsVC.swift
//  Alias-First-App
//
//  Created by Сергей Непомящий on 04.01.2021.
//

import UIKit

class TeamsVC: UIViewController {

    @IBOutlet weak var stack: UIStackView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
  
    @IBAction func onBtn_Create(_ sender: Any) {
        createButton("Team NUMBER")
    }
    
    @IBAction func onBtn_Delete(_ sender: Any) {
        if let v = stack.arrangedSubviews.last {
            stack.removeArrangedSubview(v)
            v.removeFromSuperview()
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
