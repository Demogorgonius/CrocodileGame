//
//  GameManager.swift
//  CrocodileGame
//
//  Created by Andrey on 21.04.2023.
//

import Foundation

class GameManager {
    var totalRounds = 0
    var teamsWhoPlay: [Team] = []
    
    init() {
        print("Game manager init")
    }
    
    func getCurrentTeam() -> Team {
        
        return Team(name: "Dancers", points: 0, pointsLifetime: 0, didPlayNextGame: true, avatar: "💃🏻", avatarColor: .yellow)
    }
}
