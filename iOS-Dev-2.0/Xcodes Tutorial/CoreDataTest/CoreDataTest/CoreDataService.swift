//
//  File.swift
//  CoreDataTest
//
//  Created by Сергей Непомящий on 02.03.2021.
//

import UIKit
import CoreData

var data = [DataClass]()
func save(completion: (_ finished: Bool) -> ()) {
    guard let managedContext = appDelegate?.persistentContainer.viewContext else {return}
    let dataClass = DataClass(context: managedContext)
    
    dataClass.arrayOfNumbers = data[0].arrayOfNumbers
    dataClass.arrayOfStrings = data[0].arrayOfStrings
    dataClass.char = data[0].char
 
    do{
        try managedContext.save()
        debugPrint("Succesfully saved")
        completion(true)
    } catch{
        debugPrint("Could not save - \(error)")
        completion(false)
    }
}


func fetch(completion: (_ complete: Bool) -> ()) {
    guard let managedContext = appDelegate?.persistentContainer.viewContext else { return }
    
    let fetchRequest = NSFetchRequest<DataClass>(entityName: "DataClass")
    
    do {
        data = try managedContext.fetch(fetchRequest)
        print("Data fetched")
        completion(true)
    } catch {
        debugPrint("Could not fetch: \(error.localizedDescription)")
        completion(false)
    }

}

