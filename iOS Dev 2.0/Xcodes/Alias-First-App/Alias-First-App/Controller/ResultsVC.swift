//
//  ResultsVC.swift
//  Alias-First-App
//
//  Created by Сергей Непомящий on 11.02.2021.
//

import UIKit



class ResultsVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    
    @IBOutlet weak var teamTable: UITableView!
    @IBOutlet weak var wordsTable: UITableView!
    
   
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        wordsForTheRound.removeLast()
        print(results)
        
        teamTable.delegate = self
        teamTable.dataSource = self
        teamTable.backgroundColor = nil
        teamTable.separatorStyle = .none
        teamTable.isScrollEnabled = false
        teamTable.rowHeight = 50
        wordsTable.delegate = self
        wordsTable.dataSource = self
        wordsTable.backgroundColor = nil
        wordsTable.separatorStyle = .none
        wordsTable.rowHeight = 50
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableView == self.teamTable {return results.count}
        if tableView == self.wordsTable {return results[0].words.count}
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if tableView == self.teamTable {
            if let cell = tableView.dequeueReusableCell(withIdentifier: "ResultsTeamsCell") as? ResultsTeamsCell {
                cell.backgroundColor = UIColor.clear
                cell.updateCell(result: results[indexPath.row])
                return cell
            }
        }
        if tableView == self.wordsTable {
            if let cell = tableView.dequeueReusableCell(withIdentifier: "ResultsWordsCell") as? ResultsWordsCell {
                cell.backgroundColor = UIColor.clear
                cell.updateCell(wordIncmoing: results[0].words[indexPath.row], tf: results[0].wordIsCorrect[indexPath.row])
                cell.resultsWordsCellDelegate = self
                return cell
            }
        }
            return UITableViewCell()
    }
    
    
    @IBAction func playBtnPressed(_ sender: Any) {
        debugPrint(teams)
        updateTeamsAndResetCounters()
        debugPrint(teamNumber)
        debugPrint(teams)
        if checkForAWinner(teamNumber: teamNumber) { debugPrint(teamNumber); performSegue(withIdentifier: "WinVC", sender: nil) }
        else {
            nextTeamAndRoundCounter()
            
            debugPrint(teamNumber)
            performSegue(withIdentifier: "MainVC", sender: nil)}
    }
    
    
}

extension ResultsVC: ResultsWordsCellDelegate {
    func didTapRefreshButton() {
        self.wordsTable.reloadData()
        self.teamTable.reloadData()
    }
}


