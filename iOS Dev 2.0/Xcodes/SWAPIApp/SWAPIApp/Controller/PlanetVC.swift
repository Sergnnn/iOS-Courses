//
//  PlanetVC.swift
//  SWAPIApp
//
//  Created by Сергей Непомящий on 01.02.2021.
//

import UIKit

class PlanetVC: UIViewController {


   
    
    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var climateLbl: UILabel!
    @IBOutlet weak var diametrLbl: UILabel!
    @IBOutlet weak var terrainLbl: UILabel!
    @IBOutlet weak var populationLbl: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        

        print(planetForScreen)

        nameLbl.text = planetForScreen[0].name
        climateLbl.text = planetForScreen[0].climate
        diametrLbl.text = planetForScreen[0].diameter
        terrainLbl.text = planetForScreen[0].terrain
        populationLbl.text = planetForScreen[0].population
        
    }
    

    func initPlanetForScreen(name: String) {
        for i in 0...resultsPlanets.count - 1 {
            if resultsPlanets[i].name == name {
                planetForScreen[0] = resultsPlanets[i]
            }
        }
    }
    
    func clearPlanetForScreen() {
        planetForScreen.remove(at: 0)
    }
    
    func getPlanetForScreen() -> (planet){
        return planetForScreen[0]
    }
    

    @IBAction func backBtn(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    

}
