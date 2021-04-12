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
    
    let gameRules = GameRules(context: managedContext)
    gameRules.amountOfWordsToWin = Int32(rules.amountOfWords)
    gameRules.roundNumber = Int32(roundCounter)
    gameRules.roundTime = Int32(rules.roundTime)
    gameRules.teamNumber = Int32(teamNumber)
    gameRules.minusWord = rules.minusWord
    gameRules.generalWord = rules.generalWord
    gameRules.soundInGame = rules.soundInGame
    
    do{
        try managedContext.save()
        debugPrint("Succesfully saved saveGameRules")
        completion(true)
    } catch{
        debugPrint("Could not save - \(error)")
        completion(false)
    }
}


func saveWordsLeft(completion: (_ finished: Bool) -> ()) {
    guard let managedContext = appDelegate?.persistentContainer.viewContext else {return}
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
    
    for team in teams {
        let teamsCoreData = NSEntityDescription.insertNewObject(forEntityName: "TeamsCoreData", into: managedContext)
        teamsCoreData.setValue(team.name, forKey: "team")
        teamsCoreData.setValue(Int32(team.score), forKey: "score")
        teamsCoreData.setValue(Int32(team.number), forKey: "number")
    }
        
        do{
            try managedContext.save()
            debugPrint("Succesfully saved teamsCoreData")
            completion(true)
        } catch{
            debugPrint("Could not save - \(error)")
            completion(false)
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
        rules.soundInGame = cgsGameRules[0].soundInGame
        rules.generalWord = cgsGameRules[0].generalWord
        rules.minusWord = cgsGameRules[0].minusWord
    }
}

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
        try managedContext.save()
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
        try managedContext.save()
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
        try managedContext.save()
    } catch {
        print("error on delete Team")
    }
}


