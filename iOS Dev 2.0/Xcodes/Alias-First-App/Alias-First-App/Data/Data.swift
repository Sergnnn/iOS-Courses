//
//  Data.swift
//  Alias-First-App
//
//  Created by Сергей Непомящий on 29.01.2021.
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
}

struct rulesStructure {
    var amountOfWords: Int
    var roundTime: Int
    var minusWord: Bool
    var generalWord: Bool
    var soundInGame: Bool
}

var words = [word]()
var amountOfWords:Int = 0
var roundTime:Int = 0

let teamsFile: [String] = ["Коты", "Собаки", "Ниндзи", "Живчиикии", "Роботы", "Приведения", "Косатики", "Лорды", "Фиксики", "Брины", "Еноты", "Динамо", "Шахтер"]
var teamNames = teamsFile
var teams = [team]()
var rules = rulesStructure(amountOfWords: 0, roundTime: 0, minusWord: false, generalWord: false, soundInGame: false)




