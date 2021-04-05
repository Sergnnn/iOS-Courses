//
//  ViewController.swift
//  Alias-First-App
//
//  Created by Сергей Непомящий on 04.01.2021.
//

import UIKit
import CoreData

let appDelegate = UIApplication.shared.delegate as? AppDelegate

class StartVC: UIViewController {
    
    @IBOutlet weak var continueBtn: CustomBigButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        words = [word]()
        words.append(word(categoryName: "basic", categoryIsEnable: true, categoryImageName: "basicT", word: listOfWordsBasic))
        words.append(word(categoryName: "smart", categoryIsEnable: false, categoryImageName: "smartF", word: listOfWordsSmart))
        words.append(word(categoryName: "country", categoryIsEnable: false, categoryImageName: "countryF", word: listOfWordsCountry))
        
        fetchData()
    }
    
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "TeamsVC") {
            teams = [team]()
            addTeam()
            addTeam()
           }
    }
 
    
    @IBAction func newGameBtn(_ sender: Any) {
        print(teams)
        deleteData()
        performSegue(withIdentifier: "TeamsVC", sender: nil)
    }
    
    @IBAction func continueBtn(_ sender: Any) {
        print(teams)
        if teams.count > 1 {performSegue(withIdentifier: "MainVC", sender: nil)}
    }
    
    func fetchData() {
            fetchTeams { (complete) in
                if complete {print("Teams fetched")}
                else {return}
            }
            fetchGameRules { (complete) in
                if complete {print("Game Rules Fethced")}
            }
            fetchWordsLeft{ (complete) in
                if complete {print("Words Fetched")}
            }
    }

}

