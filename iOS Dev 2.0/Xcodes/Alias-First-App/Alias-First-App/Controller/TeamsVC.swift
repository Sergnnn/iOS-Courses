//
//  TeamsVC.swift
//  Alias-First-App
//
//  Created by Сергей Непомящий on 04.01.2021.
//

import UIKit


class TeamsVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
   
    var tapCount:Int = 0
    var tapTimer:Timer?
    var tappedRow:Int?
    
    @IBOutlet weak var plusBtn: UIButton!
    @IBOutlet weak var teamsTable: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        teamsTable.delegate = self
        teamsTable.dataSource = self
        teamsTable.rowHeight = 55
        teamsTable.isScrollEnabled = false
        teamsTable.backgroundColor = nil
        teamsTable.separatorStyle = .none
    }
    
// MARK: - TableView
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return teams.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "TeamsCell") as? TeamsCell {
            cell.updateCell(team: teams[indexPath.row])
            cell.teamsCellDelegate = self
            cell.deleteButtonShowHide()
            return cell
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //debugPrint("Checking for double taps here")
          if(tapCount == 1 && tapTimer != nil && tappedRow == indexPath.row){
              //debugPrint("double tap - Put your double tap code here")
            teams[indexPath.row].name = chooseTeamName()
            teamsTable.reloadData()
              tapTimer?.invalidate()
              tapTimer = nil
              tapCount = 0
          }
          else if(tapCount == 0){
            //debugPrint("This is the first tap. If there is no tap till tapTimer is fired, it is a single tap")
              tapCount = tapCount + 1;
              tappedRow = indexPath.row;
            tapTimer = Timer.scheduledTimer(timeInterval: 0.4, target: self, selector: #selector (tapTimerFired), userInfo: nil, repeats: false)
          }
          else if(tappedRow != indexPath.row){
            //debugPrint("Tap on new row")
              tapCount = 0;
              if(tapTimer != nil){
                  tapTimer?.invalidate()
                  tapTimer = nil
              }
          }
      }
    
     @objc func tapTimerFired(aTimer:Timer){
            //debugPrint("Timer fired, there was a single tap on indexPath.row = tappedRow")
          if(tapTimer != nil){
              tapCount = 0;
              tappedRow = -1;
          }
    }
    
// MARK: - plusBtn
    @IBAction func plusBtnTapped(_ sender: Any) {
        plusBtnHide()
        addTeam()
        teamsTable.reloadData()
        print(teams)
    }
    
    func plusBtnShow() {
        if teams.count < 5 {plusBtn.isHidden = false}
    }
    
    func plusBtnHide() {
        if teams.count == 4 { plusBtn.isHidden = true}
    }
    
    
}
// MARK: - Extension
extension TeamsVC: TeamsCellDelegate {
    func deleteCell() {
        self.teamsTable.reloadData()
        self.plusBtnShow()
    }
}
