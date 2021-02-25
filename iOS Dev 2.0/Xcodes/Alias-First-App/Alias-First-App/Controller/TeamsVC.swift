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
    var textField: UITextField?
   
    
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
        
        let doublePress = UITapGestureRecognizer(target: self, action: #selector(doubleTapped))
        doublePress.numberOfTapsRequired = 2
        teamsTable.addGestureRecognizer(doublePress)
        
        let longPress = UILongPressGestureRecognizer(target: self, action: #selector(longpress))
        teamsTable.addGestureRecognizer(longPress)
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
            cell.selectionStyle = .none
            return cell
        }
        return UITableViewCell()
    }
    
//MARK: - Double Tap
    @objc func doubleTapped(sender: UIGestureRecognizer) {
            let touchPoint = sender.location(in: teamsTable)
            if let indexPath = teamsTable.indexPathForRow(at: touchPoint) {
                teams[indexPath.row].name = chooseTeamName()
                teamsTable.reloadData()
        }
    }
    
//MARK: - LongPress
    @objc func longpress(sender: UILongPressGestureRecognizer) {
                if sender.state == UIGestureRecognizer.State.began {
                    let touchPoint = sender.location(in: teamsTable)
                    if let indexPath = teamsTable.indexPathForRow(at: touchPoint) {
                        showAlert(indexPath: indexPath)
                    }
                }
            }

//MARK: - Configuering Alert
    func configurationTextField(textField: UITextField!) {
        if (textField) != nil {
            self.textField = textField!        //Save reference to the UITextField
         //   self.textField?.placeholder = "Some text"
        }
    }
    
    func setNameForPlaceHodler(indexPath: IndexPath) {self.textField?.placeholder = teams[indexPath.row].name}
    
    func showAlert(indexPath: IndexPath) {
        let refreshAlert = UIAlertController(title: "Новое название", message: "", preferredStyle: UIAlertController.Style.alert)
        refreshAlert.addTextField(configurationHandler: configurationTextField(textField:))
        setNameForPlaceHodler(indexPath: indexPath)

        refreshAlert.addAction(UIAlertAction(title: "Ok", style: .default, handler: { (action: UIAlertAction!) in
              debugPrint("Handle Ok logic here")
            if self.textField?.text != "" {teams[indexPath.row].name = self.textField!.text!}
            else {return}
            self.teamsTable.reloadData()
        }))
        refreshAlert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: { (action: UIAlertAction!) in
              debugPrint("Handle Cancel Logic here")
        }))

        present(refreshAlert, animated: true, completion: nil)
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



