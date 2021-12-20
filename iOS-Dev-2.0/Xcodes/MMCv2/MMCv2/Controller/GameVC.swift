//
//  GameVC.swift
//  MMCv2
//
//  Created by Serg Nepomyaschyy on 12.12.2021.
//

import GoogleMobileAds
import UIKit

class GameVC: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource, GADBannerViewDelegate  {

    @IBOutlet var bannerView: GADBannerView!
    
    @IBOutlet weak var Player1Label: CustomMainLabel!
    @IBOutlet weak var Player1Money: CustomMainLabel!
    @IBOutlet weak var valueTextField: CustomPlayersTxtField!
    
    @IBOutlet weak var stack: UIStackView!
    
    @IBOutlet weak var picker: UIPickerView!
    
    var otherValueLabel = [CustomMainLabel]()
    var pickerData: [[String]] = [[String]]()
  
    
//-------------------------------------------------------------------------------------
    override func viewDidLoad() {
        super.viewDidLoad()
        
        bannerView.adUnitID = "ca-app-pub-1963870271091860/3985753607"
        bannerView.rootViewController = self
        bannerView.load(GADRequest())
        bannerView = GADBannerView(adSize: GADAdSizeBanner)
        addBannerViewToView(bannerView)
        bannerView.delegate = self
    
        
        setTimeStart()
        
        let TransferMoneyBtn = TransferMoneyButton(frame: CGRect(x: 0, y: 0, width: view.frame.size.width, height: 60))
        TransferMoneyBtn.addTarget(self, action: #selector(GameVC.transferMoney), for: .touchUpInside)
        valueTextField.inputAccessoryView = TransferMoneyBtn
        
        Player1Label.text = players[1].name
        Player1Money.text = String(players[1].money)
        
        // Connect data:
        self.picker.delegate = self
        self.picker.dataSource = self
        
        // Input the data into the array
        pickerData = [createArrayOfplayersNames(),
                      ["->"],
                      createArrayOfplayersNames()]
        
        print("amount of element in array: \(amountOfP)")
        for i in 2...amountOfP {
            createNameValueStack(title: players[i].name, value: players[i].money)
        }

        
    }
    
//-------------------------------------------------------------------------------------
    
    // Number of columns of data
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 3
    }
    
    // The number of rows of data
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerData[component].count
    }
    
    // The data to return fopr the row and component (column) that's being passed in
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerData[component][row]
    }
       // Capture the picker view selection
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
            // This method is triggered whenever the user makes a change to the picker selection.
            // The parameter named row and component represents what was selected.
    }
    
    @objc func transferMoney() {
       
         if Int(valueTextField.text!) != nil {
            moneyTransfer(id1: picker.selectedRow(inComponent: 0), id2: picker.selectedRow(inComponent: 2), value: Int(valueTextField.text!)!)}

        Player1Money.text = String(players[1].money)
        bankruptcyCheck(id: 1, oldtxtlabel: Player1Money)
        
        for i in 2...(players.count - 1) {
            otherValueLabel[i - 2].text = String(players[i].money)
            bankruptcyCheck(id: i, oldtxtlabel: otherValueLabel[i - 2])
            }
        
        pickerData = [createArrayOfplayersNames(),
                      ["->"],
                      createArrayOfplayersNames()]
        picker.reloadAllComponents()
        
        
        print(players.description)
        view.endEditing(true)
    }
    
    
    func createNameValueStack(title: String, value: Int) {
        
        let nameLabel = CustomMainLabel()
        nameLabel.CustomMainLable()
        nameLabel.text = title
        let valueLabel = CustomMainLabel()
        valueLabel.CustomMainLable()
        valueLabel.text = String(value)
        otherValueLabel.append(valueLabel)
        
        let stackH = UIStackView(arrangedSubviews: [nameLabel, valueLabel])
        
       stack.addArrangedSubview(stackH)
    }
    
    func addBannerViewToView(_ bannerView: GADBannerView) {
      bannerView.translatesAutoresizingMaskIntoConstraints = false
      view.addSubview(bannerView)
    }

    
}

