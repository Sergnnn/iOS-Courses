//
//  ViewController.swift
//  SWAPIApp
//
//  Created by Сергей Непомящий on 30.01.2021.
//

import UIKit

class MainVC: UIViewController, UITableViewDelegate, UITableViewDataSource {


    
    @IBOutlet weak var charNameTable: UITableView!
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
    
        getResults()
        getPlanets()

        charNameTable.delegate = self
        charNameTable.dataSource = self
        
    }
    
    
    func getResults() {
        ApiService.shared.getResultsFromURL(onSuccess: { (people) in
            results.append(contentsOf: people.results)
            results.sort {$0.name < $1.name}
            self.charNameTable.reloadData()
        }, onError: { (error) in
            debugPrint(error)
        }, urlStringType: "\(ApiService.shared.URL_BASE)\(ApiService.shared.URL_PEOPLE)")
        
        for i in 2...9 {
            ApiService.shared.getResultsFromURL(onSuccess: { (people) in
                results.append(contentsOf: people.results)
                results.sort {$0.name < $1.name}
                self.charNameTable.reloadData()
            }, onError: { (error) in
                debugPrint(error)
            }, urlStringType: "\(ApiService.shared.URL_BASE)\(ApiService.shared.URL_PEOPLE)\(ApiService.shared.URL_PEOPLE_PAGE_NUMBERFROMCYCLE)\(i)")
        }

    }
    
    func getPlanets() {
            for i in 1...60 {
                ApiService.shared.getPlanetsFromURL(onSuccess: { (planet) in
                    resultsPlanets.append(planet)
                }, onError: { (error) in
                    debugPrint(error)
                }, urlStringType: "\(ApiService.shared.URL_BASE)\(ApiService.shared.URL_PLANETS)/\(i)")
            }
            
    }
    

    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return results.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "CharacterCell") as? CharacterCell {
            cell.updatecell(resuls: results[indexPath.row])
            return cell
        }
        
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detail = results[indexPath.row]
        performSegue(withIdentifier: "DetailedVC", sender: detail)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        initDetailedResults()
        
        
        if let detailedVC = segue.destination as? DetailedVC {
            detailedVC.initDetailedResultsForScreen(result: sender as! result)
            
        }
    }
    

}

