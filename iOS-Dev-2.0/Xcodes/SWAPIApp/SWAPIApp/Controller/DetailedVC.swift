//
//  DetailedVC.swift
//  SWAPIApp
//
//  Created by Сергей Непомящий on 31.01.2021.
//

import UIKit

class DetailedVC: UIViewController {
 
    
    
    var detailedResultsForScreen = [detailedResult(name: "", height: "", eye_color: "", birth_year: "", homeworld: "")]
    
    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var heightLbl: UILabel!
    @IBOutlet weak var birthYearLbl: UILabel!
    @IBOutlet weak var eyeColorLbl: UILabel!
    @IBOutlet weak var homeworldBtn: UIButton!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        print(detailedResultsForScreen)
        PlanetVC().initPlanetForScreen(name: detailedResultsForScreen[0].homeworld)
        
        nameLbl.text = detailedResultsForScreen[0].name
        heightLbl.text = detailedResultsForScreen[0].height
        birthYearLbl.text = detailedResultsForScreen[0].birth_year
        eyeColorLbl.text = detailedResultsForScreen[0].eye_color
        homeworldBtn.setTitle(detailedResultsForScreen[0].homeworld, for: .normal)

 
    }
    
 
    func initDetailedResultsForScreen(result: result) {
        for i in 0...detalideResults.count - 1 {
            if detalideResults[i].name == result.name {
                detailedResultsForScreen[0] = detalideResults[i]
            }
        }
    }
    
    func clearDetailedResultsForScreen() {
        detailedResultsForScreen.remove(at: 0)
    }
    
    
    @IBAction func homeworldBtn(_ sender: Any) {
        if homeworldBtn.currentTitle == "unknown" {
            return
        } else {
            let planet = PlanetVC().getPlanetForScreen()
            performSegue(withIdentifier: "PlanetVC", sender: planet)
        }
      
   
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        PlanetVC().initPlanetForScreen(name: detailedResultsForScreen[0].homeworld)
    }

    @IBAction func backBtn(_ sender: Any) {
      clearDetailedResultsForScreen()
        dismiss(animated: true, completion: nil)
    }
    
}
