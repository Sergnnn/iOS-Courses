//
//  Model.swift
//  Monopoly Money Counter
//
//  Created by Сергей Непомящий on 09.01.2021.
//

import Foundation

struct Player {
    
    var id: Int
    var name: String
    var money: Int
    
}

var players = [Player]()
var bank = Player(id: 0, name: "Bank", money: 1000000)

var amountOfP:Int = 4
//-------Statics block-----------------//
var amountOfTransfers: Int = 0
//var timeStart =
//-------Statics block-----------------//
func createArrayOfplayersNames() -> ([String]) {
    var array = [String]()
    for i in 0...(players.count - 1) {
        array.append(players[i].name)
    }
    return array
}

func moneyTransfer (id1: Int, id2: Int, value: Int) -> () {
    players[id1].money -= value
    players[id2].money += value
    amountOfTransfers += 1
}



func bankruptcyCheck (id: Int, oldtxtlabel: CustomMainLabel) -> () {
    if players[id].money < 0 {
        let newtxtlabel = oldtxtlabel
        newtxtlabel.text = "Bankrupt"
    }
}

func bankruptcyRemove (id: Int) -> (Bool) {

    if players[id].money < 0 {
                players.remove(at: id)
                return true
            }
    return false
        }





