//
//  Model.swift
//  Alias-First-App
//
//  Created by Сергей Непомящий on 02.02.2021.
//

import Foundation


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
    newTeams.append(team(name: chooseTeamName()))
    teams = newTeams
    
}

func deleteLastTeam() -> () {
    var newTeams = teams
    newTeams.removeLast()
    teams = newTeams
}


