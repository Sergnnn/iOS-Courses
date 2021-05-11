//
//  File.swift
//  SWAPIApp
//
//  Created by Сергей Непомящий on 30.01.2021.
//

import Foundation

var results = Array<result>()
var detalideResults = Array<detailedResult>()

var resultsPlanets = Array<planet>()
var planetForScreen = [planet(climate: "", created: "", diameter: "", edited: "", films: [""], gravity: "", name: "", orbital_period: "", population: "", residents: [""], rotation_period: "", surface_water: "", terrain: "", url: "")]

struct api: Codable {
    let films: String
    let people: String
    let planets: String
    let species: String
    let starships: String
    let vehicles: String
}


struct people: Codable {
    let count: Int
    let next: String?
    let previous: String?
    let results: [result]
}

struct result: Codable{
    let name: String
    let height: String
    let mass: String
    let hair_color: String
    let skin_color: String
    let eye_color: String
    let birth_year: String
    let gender: String
    let homeworld: String
    let films: [String]
    let species: [String]
    let vehicles: [String]
    let starships: [String]
    let created: String
    let edited: String
    let url: String
}

struct detailedResult{
    let name: String
    let height: String
    let eye_color: String
    let birth_year: String
    var homeworld: String
}

struct planets {
    let count: Int
    let next: String?
    let previous: String?
    let results: [planet]
}

struct planet: Codable {
    let climate: String
    let created: String
    let diameter: String
    let edited: String
    let films: [String]
    let gravity: String
    let name: String
    let orbital_period: String
    let population: String
    let residents: [String]
    let rotation_period: String
    let surface_water: String
    let terrain: String
    let url: String
}

func initDetailedResults() {
    for i in 0...81 {
        var resultToAdd = detailedResult(name: results[i].name, height: results[i].height, eye_color: results[i].eye_color, birth_year: results[i].birth_year, homeworld: results[i].homeworld)
        for k in 0...59 {
            if resultToAdd.homeworld == resultsPlanets[k].url {
                resultToAdd.homeworld = resultsPlanets[k].name
                
            }
        }

        detalideResults.append(resultToAdd)
    }
}
