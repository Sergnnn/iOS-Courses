//
//  ViewController.swift
//  CoreDataTest
//
//  Created by Сергей Непомящий on 02.03.2021.
//

import UIKit
import CoreData

let appDelegate = UIApplication.shared.delegate as? AppDelegate

class ViewController: UIViewController {
    @IBOutlet weak var label: UILabel!

   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        fetchCoreDataObjects()
        label.text = """
            arrayOfNumbers: \(data[0].arrayOfNumbers)
            arrayOfStrings: \(data[0].arrayOfStrings)
            char: \(data[0].char)
        """
        
    }
    
    func fetchCoreDataObjects(){
        fetch { (complete) in
            if complete {
                print("Data fetcehd")
                } else {
                    print("Error happpened whiule fetcihn")
                }
            }
        }
    
    
    func randomString(length: Int) -> String {
        let letters = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
        return String((0..<length).map{ _ in letters.randomElement()! })
    }

    @IBAction func saveBtn(_ sender: Any) {
        save { (complete) in
            if complete {debugPrint("Compelte")}
        }
    }
    @IBAction func changeArrayNumbers(_ sender: Any) {
        data[0].arrayOfNumbers = [Int.random(in: 1...100), Int.random(in: 1...100)]
        print(data.description)
    }
 
    @IBAction func chageLetter(_ sender: Any) {
        data[0].char = randomString(length: 1)
        print(data.description)
    }
   
    @IBAction func changeArrayString(_ sender: Any) {
        data[0].arrayOfStrings = [randomString(length: 1),randomString(length: 1)]
        print(data.description)
    }
    
    @IBAction func updateLabel(_ sender: Any){
        label.text = """
            arrayOfNumbers: \(data[0].arrayOfNumbers)
            arrayOfStrings: \(data[0].arrayOfStrings)
            char: \(data[0].char)
        """
    }
    
   
}

