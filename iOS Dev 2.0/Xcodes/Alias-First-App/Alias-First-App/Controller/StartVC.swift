//
//  ViewController.swift
//  Alias-First-App
//
//  Created by Сергей Непомящий on 04.01.2021.
//

import UIKit
import AVFoundation
import AVKit

class StartVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        words = [word]()
        
        words.append(word(categoryName: "Category A", categoryIsEnable: true, categoryImageName: "catA", word: listOfWordsA))
        words.append(word(categoryName: "Category B", categoryIsEnable: false, categoryImageName: "catB", word: listOfWordsB))
        words.append(word(categoryName: "Category C", categoryIsEnable: false, categoryImageName: "catC", word: listOfWordsC))
        
        
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        teams = [team]()
        addTeam()
        addTeam()
    }
 
    
    @IBAction func newGameBtn(_ sender: Any) {
        
        print(teams)
    }
    
}

