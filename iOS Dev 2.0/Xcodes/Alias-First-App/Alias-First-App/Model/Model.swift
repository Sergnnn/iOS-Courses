//
//  Model.swift
//  Alias-First-App
//
//  Created by Сергей Непомящий on 02.02.2021.
//

import Foundation

struct word {
    var categoryName: String
    var categoryIsEnable: Bool
    var categoryImageName: String
    var word: [String]
}

struct team {
    var name: String
    var number: Int
    var score: Int
}

struct rulesStructure {
    var amountOfWords: Int
    var roundTime: Int
    var minusWord: Bool
    var generalWord: Bool
    var soundInGame: Bool
}

struct result{
    var team: String
    var score: Int
    var words: [String]
    var wordIsCorrect: [Bool]
}

var words = [word]()
var wordsForTheGame = [String]()
var wordsForTheRound = [String]()
var amountOfWords: Int = 0
var roundTime: Int = 0
var roundCounter: Int = 1
var scoreOfTheRound: Int = 0
var teamNumber: Int = 0
var results = [result(team: "", score: 0, words: [], wordIsCorrect: [])]


let teamsFile: [String] = ["Коты", "Собаки", "Ниндзи", "Живчиикии", "Роботы", "Приведения", "Косатики", "Лорды", "Фиксики", "Брины", "Еноты", "Динамо", "Шахтер"]
var teamNames = teamsFile
var teams = [team]()
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

func addTeam() {
    var newTeams = teams
    newTeams.append(team(name: chooseTeamName(), number: newTeams.count, score: 0))
    teams = newTeams
}

func deleteLastTeam() {
    var newTeams = teams
    newTeams.removeLast()
    teams = newTeams
}

func getWordsForTheGame() {
    for i in 0...words.count - 1 {
        if words[i].categoryIsEnable {
            wordsForTheGame.append(contentsOf: words[i].word)
        }
    }
    if wordsForTheGame.count == 0 {
        wordsForTheGame.append(contentsOf: words[0].word)
    }
}
    
func getRandomWordAndRemoveIt() -> String{
        let randomNumber = Int.random(in: 0...wordsForTheGame.count - 1)
        let randomWord = wordsForTheGame[randomNumber]
        wordsForTheRound.append(randomWord)
        wordsForTheGame.remove(at: randomNumber)
        return randomWord
    }

func nextTeamAndRoundCounter() {
    if teamNumber < teams.count - 1 { teamNumber += 1 }
    else { teamNumber = 0 ; roundCounter += 1 }
}

func updateTeamsAndResetCounters() {
    for i in 0...teams.count - 1 {
        if teams[i].name == results[0].team {
            teams[i].score += results[0].score
        }
    }
    scoreOfTheRound = 0
    results[0].words.removeAll()
    results[0].wordIsCorrect.removeAll()
}

func checkForAWinner(teamNumber: Int) -> Bool {
    if teams[teamNumber].score >= rules.amountOfWords {return true}
    else {return false}
}

