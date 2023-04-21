//
//  TeamManager.swift
//  CrocodileGame
//
//  Created by Mikhail Tedeev on 21.04.2023.
//

import Foundation

class TeamManager {
    static let shared = TeamManager()
    var arrOfTeams: [Team] = []
    
    var userDefaults = UserDefaults.standard
    let encoder = JSONEncoder()
    let decoder = JSONDecoder()
    
    func getTeams() -> [Team] {
        let defaultTeams = [Team(name: "Ковбои",
                                 points: 0,
                                 pointsLifetime: 0,
                                 didPlayNextGame: true,
                                 avatar: "🤠", avatarColor: .red),
                            Team(name: "Стройняшки",
                                 points: 0,
                                 pointsLifetime: 0,
                                 didPlayNextGame: true,
                                 avatar: "🍔", avatarColor: .purple)]
        /// Подгружаем команды из юзердефолтс. Если нил, то создаем две по умолчанию
        guard let savedTeams = userDefaults.object(forKey: "teams") as? Data else {
            print("cant get teams from UserDefaults")
            return defaultTeams
        }
        guard let decodedTeams = try? decoder.decode([Team].self, from: savedTeams) else {
            print("cant get decode teams")
            return defaultTeams
        }
        arrOfTeams = decodedTeams
        print("done decode", decodedTeams)
        return decodedTeams
    }
    
    func saveTeams(teams: [Team]) {
        guard let encoded =  try? encoder.encode(teams) else { return }
        userDefaults.set(encoded, forKey: "teams")
    }
    
    func getTeamsWhoPlay() -> [Team] {
        let allTeams = getTeams()
        var whoPlay = [Team]()
        allTeams.forEach { team in
            if team.didPlayNextGame {
                whoPlay.append(team)
            }
        }
        return whoPlay
    }
    
    func createTeam(nameTeam: String) {
        var allTeams = getTeams()
        if allTeams.contains(where: { team in
            if nameTeam == team.name {
                return true
            }
            return false
        }) {
            let updatedTeam = allTeams.map { team -> Team in
                if team.name == nameTeam {
                    var modify = team
                    modify.didPlayNextGame = !team.didPlayNextGame
                    return modify
                } else {
                    return team
                }
            }
            saveTeams(teams: updatedTeam)
        } else {
            let emoji = ["❤️", "😭", "🥺", "☺️", "💀", "😈","🥵",
                         "💰", "☹️", "💩", "🙈", "🎈", "🍔", "🤠"]
            allTeams.append(Team(name: nameTeam,
                                 points: 0,
                                 pointsLifetime: 0,
                                 didPlayNextGame: true,
                                 avatar: emoji.randomElement()!,
                                 avatarColor: CrocodileColors.allCases.randomElement()!))
            saveTeams(teams: allTeams)
        }
    }
    
    func addPointToTeam(_ team: Team) {
        
    }

}
