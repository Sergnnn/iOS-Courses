//
//  ViewController.swift
//  Swoosh App
//
//  Created by Сергей Непомящий on 28.12.2020.
//

import UIKit

class WelcomeVC: UIViewController {
    
    @IBOutlet weak var swoosh: UIImageView!
    @IBOutlet weak var bgImg: UIImageView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Old way of constraines
        //        swoosh.frame = CGRect(x: view.frame.size.width / 2 - swoosh.frame.size.width / 2, y: 50, width: porscheLogo.frame.size.width, height: porscheLogo.frame.size.height)
        //        porscheBackgroundMain.frame = view.frame;
        
        
    }

    //Back Button  !   !   !
    @IBAction func unwindFromLeagueVC(unwindSeques: UIStoryboardSegue) {
        
    }

}

