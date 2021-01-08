//
//  Model.swift
//  Alias-First-App
//
//  Created by Сергей Непомящий on 06.01.2021.
//

import Foundation

let teamsFile: [String] = ["Коты", "Собаки", "Ниндзи", "Живчиикии", "Роботы", "Приведения", "Косатики", "Лорды", "Фиксики", "Брины", "Еноты", "Динамо", "Шахтер"]

struct teamsStructure {

    var teamNames: [String]
    var teamsCount: Int

}

struct rulesStructure {
    
    var amountOfWords: Int
    var roundTime: Int
    var minusWord: Bool
    var generalWord: Bool
    var soundInGame: Bool
    
}

var teamNames = teamsFile
var teams = teamsStructure(teamNames: [], teamsCount: 0)
var rules = rulesStructure(amountOfWords: 0, roundTime: 0, minusWord: false, generalWord: false, soundInGame: false)

   
func chooseTeamName() -> (String) {
   
    if teamNames.count == 0 {
            teamNames = teamsFile
        }
    
        let arrayOfNames = teamNames
        let number = Int.random(in: 0...arrayOfNames.count - 1)
        let teamName = arrayOfNames[number]
        teamNames.remove(at: number)
        
        return teamName
    }

func addTeam() -> () {
    
    var newTeams = teams
    newTeams.teamNames.append(chooseTeamName())
    newTeams.teamsCount += 1
    teams = newTeams
    
}

func deleteLastTeam() -> () {
    var newTeams = teams
    //teamNames.append(newTeams.teamNames[newTeams.teamNames.count - 1])
    newTeams.teamNames.removeLast()
    newTeams.teamsCount -= 1
    teams = newTeams
}


