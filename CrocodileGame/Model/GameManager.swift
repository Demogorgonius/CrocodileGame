//
//  GameManager.swift
//  CrocodileGame
//
//  Created by Andrey on 21.04.2023.
//

import Foundation

class GameManager {
    
    let teamManager = TeamManager()
    let categoryStorage = CategoryStorage()
    
    let conditionals = [
        "Объясни с помощью слов",
        "Объясни с помощью жестов",
        "Объясни с помощью рисунка",
        "Объясняй со злостью",
        "Объясняй с помощью мимики",
        "Объясняй вульгарно",
        "Объясняй сексуально",
    ]
    var teamsWhoPlay: [Team] = []
    var wordsForGame: [String] = []
    var currentRound = 1
    var totalRound = 0
    var isLastRound = false
    var currentTeamIndex = 0
    
    init() {
        readWordsFromCategory()
        readTeamsFromTeamManager()
    }
    
    func getCurrentTeam() -> Team {
        return teamsWhoPlay[currentTeamIndex]
    }
    
    func getNextTeam() -> Team {
        if currentTeamIndex != teamsWhoPlay.count - 1 {
            return teamsWhoPlay[currentTeamIndex + 1]
        } else {
            return teamsWhoPlay[0]
        }
    }
    
    func getWord() -> Word {
        var word = ""
        
        if (currentRound - 1) < wordsForGame.count {
            word = wordsForGame[currentRound - 1]
        } else {
            word = wordsForGame.randomElement()!
        }
        
        let conditionals = conditionals.randomElement()!
        return Word(word: word, conditionals: conditionals)
    }
    
    func rightAnswer() {
        teamManager.addPointToTeam(teamsWhoPlay[currentTeamIndex].name)
        teamsWhoPlay[currentTeamIndex].points += 1
    }
    
    func changeTeam() {
        if currentTeamIndex != teamsWhoPlay.count - 1 {
            currentTeamIndex += 1
        } else {
            currentTeamIndex = 0
        }
        
        if currentRound == totalRound - 1 {
            isLastRound = true
        }
        
        if currentRound < totalRound {
            currentRound += 1
        }
    }
    
    func readWordsFromCategory() {
        wordsForGame = categoryStorage.getWordsForGame()
    }
    
    func readTeamsFromTeamManager() {
        teamsWhoPlay = teamManager.getTeamsWhoPlay()
        totalRound = teamsWhoPlay.count * 5
    }
}
