import UIKit

let teamsFile: [String] = ["Коты", "Собаки", "Ниндзи", "Живчиикии", "Роботы", "Приведения", "Косатики", "Лорды", "Фиксики", "Брины", "Еноты", "Динамо", "Шахтер"]



struct teamsStructure {

    var teamNames: [String]
    var teamsCount: Int

}

var teamNames = teamsFile
var teams = teamsStructure(teamNames: [], teamsCount: 0)
   
func chooseTeamName() -> (String) {
   
    if teamsFile.count == 0 {
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

addTeam()
addTeam()
addTeam()
addTeam()
addTeam()

var team1 = teams.teamNames[0]
var team2 = teams.teamNames[1]
var team3 = teams.teamNames[2]
var team4 = teams.teamNames[3]
var team5 = teams.teamNames[4]


