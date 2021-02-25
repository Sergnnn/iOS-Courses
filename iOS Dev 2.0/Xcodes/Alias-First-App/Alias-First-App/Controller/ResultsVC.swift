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
        if tableView == self.wordsTable {return getNumberOfWords()}
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if tableView == self.teamTable {
            if let cell = tableView.dequeueReusableCell(withIdentifier: "ResultsTeamsCell") as? ResultsTeamsCell {
                cell.backgroundColor = UIColor.clear
                cell.updateCell(result: results[indexPath.row])
                cell.selectionStyle = .none
                return cell
            }
        }
        if tableView == self.wordsTable {
            if let cell = tableView.dequeueReusableCell(withIdentifier: "ResultsWordsCell") as? ResultsWordsCell {
                cell.backgroundColor = UIColor.clear
                let totalRows = tableView.numberOfRows(inSection: indexPath.section)
                if indexPath.row < totalRows - 1{cell.updateCell(wordIncmoing: results[0].words[indexPath.row], tf: results[0].wordIsCorrect[indexPath.row])}
                if indexPath.row == totalRows - 1 {
                    if results.count == 1 {cell.updateCell(wordIncmoing: results[0].words[indexPath.row], tf: results[0].wordIsCorrect[indexPath.row])}
                    if results.count == 2 {cell.updateCell(wordIncmoing: results[1].words[0], tf: results[1].wordIsCorrect[0])}
                }
                cell.selectionStyle = .none
                cell.resultsWordsCellDelegate = self
                return cell
            }
        }
            return UITableViewCell()
    }
    
    
    @IBAction func playBtnPressed(_ sender: Any) {
        updateTeamsAndResetCounters()
        debugPrint(teams)
        if checkForWinnerAndLastRound(){ debugPrint(teamNumber); performSegue(withIdentifier: "WinVC", sender: nil) }
        else {
            nextTeamAndRoundCounter()
            debugPrint(teamNumber)
            performSegue(withIdentifier: "MainVC", sender: nil)}
    }
    

    func getNumberOfWords() -> Int{
        if results.count == 2 {return results[0].words.count + 1}
        else {return results[0].words.count}
    }

    func showAlert() {
        let refreshAlert = UIAlertController(title: "Выберите команду, которая угадала слово:", message: "", preferredStyle: UIAlertController.Style.alert)
        
        for i in 0...teams.count - 1{
            refreshAlert.addAction(UIAlertAction(title: "\(teams[i].name)", style: .default, handler: { (action: UIAlertAction!) in
                debugPrint("\(teams[i].name) should get last word")
                self.generalWord(teamName: teams[i].name) // FIX GENERAL WORD
            }))
        }
        present(refreshAlert, animated: true, completion: nil)
    }
    func generalWord(teamName: String) {// FIX GENERAL WORD
        print("general word funciton")
        if teamName == results[0].team { results[0].wordIsCorrect[results[0].wordIsCorrect.count - 1] = true ;results[0].score += 1; print("old Team")}
        else {
            results.append(result(team: teamName, score: 1, words: [results[0].words[results[0].words.count - 1]], wordIsCorrect: [true]))
            results[1].words[0] = "\(results[1].words[0])(\(teamName))"
            results[0].wordIsCorrect.removeLast()
            results[0].words.removeLast()
            print("new Team")
            debugPrint(results)
            
        }
        didTapRefreshButton()
    }
}



//MARK: - Extension
extension ResultsVC: ResultsWordsCellDelegate {
    func didTapRefreshButton() {
        self.wordsTable.reloadData()
        self.teamTable.reloadData()
    }
    func lastWordsAlertForTrue() {
        debugPrint("ALERT ACTION")
        self.showAlert()
    }
}


