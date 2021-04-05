//
//  ContinueGameService.swift
//  Alias-First-App
//
//  Created by Сергей Непомящий on 02.03.2021.
//

import UIKit
import CoreData



var cgsGameRules = [GameRules]()
var cgsWordsLeft = [WordsLeft]()
var cgsTeams = [TeamsCoreData]()


func savedata() {
        saveWordsLeft { (complete) in
            if complete {print("WordsSaved")}
        }
        saveTeams { (complete) in
            if complete {print("TeamsSaved")}
        }
        saveGameRules { (complete) in
            if complete {print("GameRulesSaved")}
        }
}

func deleteData() {
    deleteTeams()
    deleteGameRules()
    deleteWordsLeft()
}


func saveGameRules(completion: (_ finished: Bool) -> ()) {
    
    
    guard let managedContext = appDelegate?.persistentContainer.viewContext else {return}
//    let privateManagedContext = NSManagedObjectContext(concurrencyType: .privateQueueConcurrencyType)
//    privateManagedContext.parent = managedContext
    
    let gameRules = GameRules(context: managedContext)
    gameRules.amountOfWordsToWin = Int32(rules.amountOfWords)
    gameRules.roundNumber = Int32(roundCounter)
    gameRules.roundTime = Int32(rules.roundTime)
    gameRules.teamNumber = Int32(teamNumber)
    
    do{
        try managedContext.save()
        debugPrint("Succesfully saved saveGameRules")
        completion(true)
    } catch{
        debugPrint("Could not save - \(error)")
        completion(false)
    }
}

//func saveWordsLeft(completion: (_ finished: Bool) -> ()) {
//    guard let managedContext = appDelegate?.persistentContainer.viewContext else {return}
////    let privateManagedContext = NSManagedObjectContext(concurrencyType: .privateQueueConcurrencyType)
////    privateManagedContext.parent = managedContext
//
//    for word in wordsForTheGame {
//        let wordsLeft = WordsLeft(context: managedContext)
//        wordsLeft.word = word
//
//        do{
//            try managedContext.save()
//            debugPrint("Succesfully saved saveWordsLeft")
//            completion(true)
//        } catch{
//            debugPrint("Could not save - \(error)")
//            completion(false)
//        }
//    }
//}

func saveWordsLeft(completion: (_ finished: Bool) -> ()) {
    guard let managedContext = appDelegate?.persistentContainer.viewContext else {return}
//    let privateManagedContext = NSManagedObjectContext(concurrencyType: .privateQueueConcurrencyType)
//    privateManagedContext.parent = managedContext
        let wordsLeft = WordsLeft(context: managedContext)
        wordsLeft.word = wordsForTheGame

        do{
            try managedContext.save()
            debugPrint("Succesfully saved saveWordsLeft")
            completion(true)
        } catch{
            debugPrint("Could not save - \(error)")
            completion(false)
        }
    
}
    
func saveTeams(completion: (_ finished: Bool) -> ()) {
    guard let managedContext = appDelegate?.persistentContainer.viewContext else {return}
//    let privateManagedContext = NSManagedObjectContext(concurrencyType: .privateQueueConcurrencyType)
//    privateManagedContext.parent = managedContext
    
    
    
    for team in teams {
        let teamsCoreData = TeamsCoreData(context: managedContext)
        teamsCoreData.team = team.name
        teamsCoreData.score = Int32(team.score)
        teamsCoreData.number = Int32(team.number)
        
        do{
            try managedContext.save()
            debugPrint("Succesfully saved teamsCoreData")
            completion(true)
        } catch{
            debugPrint("Could not save - \(error)")
            completion(false)
        }
    }
}



func fetchGameRules(completion: (_ complete: Bool) -> ()) {
    guard let managedContext = appDelegate?.persistentContainer.viewContext else { return }

    let fetchRequest = NSFetchRequest<GameRules>(entityName: "GameRules")

    do {
        cgsGameRules = try managedContext.fetch(fetchRequest)
        debugPrint("cgsGameRules fetched")
        completion(true)
    } catch {
        debugPrint("Could not fetch: \(error.localizedDescription)")
        completion(false)
    }
    if cgsGameRules.count > 0 {
        rules.amountOfWords = Int(cgsGameRules[0].amountOfWordsToWin)
        roundCounter = Int(cgsGameRules[0].roundNumber)
        rules.roundTime = Int(cgsGameRules[0].roundTime)
        teamNumber = Int(cgsGameRules[0].teamNumber)
    }
}

//func fetchWordsLeft(completion: (_ complete: Bool) -> ()) {
//    guard let managedContext = appDelegate?.persistentContainer.viewContext else { return }
//
//    let fetchRequest = NSFetchRequest<WordsLeft>(entityName: "WordsLeft")
//
//    do {
//        cgsWordsLeft = try managedContext.fetch(fetchRequest)
//        print("cgsGameRules fetched")
//        completion(true)
//    } catch {
//        debugPrint("Could not fetch: \(error.localizedDescription)")
//        completion(false)
//    }
//    for wordsLeft in cgsWordsLeft {
//        wordsForTheGame.append(wordsLeft.word!)
//    }
//}

func fetchWordsLeft(completion: (_ complete: Bool) -> ()) {
    guard let managedContext = appDelegate?.persistentContainer.viewContext else { return }

    let fetchRequest = NSFetchRequest<WordsLeft>(entityName: "WordsLeft")

    do {
        cgsWordsLeft = try managedContext.fetch(fetchRequest)
        if (cgsWordsLeft.count != 0 && cgsWordsLeft[0].word != nil) {wordsForTheGame = cgsWordsLeft[0].word!}
        debugPrint("cgsWordsLeft fetched")
        completion(true)
    } catch {
        debugPrint("Could not fetch: \(error.localizedDescription)")
        completion(false)
    }
    
    
}

func fetchTeams(completion: (_ complete: Bool) -> ()) {
    guard let managedContext = appDelegate?.persistentContainer.viewContext else { return }

    let fetchRequest = NSFetchRequest<TeamsCoreData>(entityName: "TeamsCoreData")

    do {
        cgsTeams = try managedContext.fetch(fetchRequest)
        print("cgsGameRules fetched")
       
        if cgsTeams.count > 1{completion(true)} else {completion (false); print("No teams")}
    } catch {
        debugPrint("Could not fetch: \(error.localizedDescription)")
        completion(false)
    }
    teams = [team]()
    for cgsTeam in cgsTeams {
        print("team - \(cgsTeam.team!) added")
        teams.append(team(name:cgsTeam.team!, number: Int(cgsTeam.number), score: Int(cgsTeam.score)))
    }
    
    
}

func deleteGameRules(){
    guard let managedContext = appDelegate?.persistentContainer.viewContext else { return }
    let fetchRequest = NSFetchRequest<GameRules>(entityName: "GameRules")
    
    let objects = try! managedContext.fetch(fetchRequest)
    for obj in objects {
        managedContext.delete(obj)
    }

    do {
        try managedContext.save() // <- remember to put this :)
    } catch {
        print("error on delete GameRules")
    }
}

func deleteWordsLeft(){
    guard let managedContext = appDelegate?.persistentContainer.viewContext else { return }
    let fetchRequest = NSFetchRequest<WordsLeft>(entityName: "WordsLeft")
    
    let objects = try! managedContext.fetch(fetchRequest)
    for obj in objects {
        managedContext.delete(obj)
    }

    do {
        try managedContext.save() // <- remember to put this :)
    } catch {
        print("error on delete WordsLeft")
    }
}

func deleteTeams(){
    guard let managedContext = appDelegate?.persistentContainer.viewContext else { return }
    let fetchRequest = NSFetchRequest<TeamsCoreData>(entityName: "TeamsCoreData")
    
    let objects = try! managedContext.fetch(fetchRequest)
    for obj in objects {
        managedContext.delete(obj)
    }

    do {
        try managedContext.save() // <- remember to put this :)
    } catch {
        print("error on delete Team")
    }
}


