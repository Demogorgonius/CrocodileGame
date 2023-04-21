//
//  TeamManager.swift
//  CrocodileGame
//
//  Created by Mikhail Tedeev on 21.04.2023.
//

import Foundation

final class TeamManager {
    
    //MARK: - Property
    
    static let shared = TeamManager()
    var arrOfTeams: [Team] = []
    var userDefaults = UserDefaults.standard
    let encoder = JSONEncoder()
    let decoder = JSONDecoder()
    
    /// Подгружаем команды из юзердефолтс. Если нил, то создаем две по умолчанию
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
        guard let savedTeams = userDefaults.object(forKey: "teams") as? Data else {
            return defaultTeams
        }
        guard let decodedTeams = try? decoder.decode([Team].self, from: savedTeams) else {
            return defaultTeams
        }
        arrOfTeams = decodedTeams
        return decodedTeams
    }
    
    /// Сохраняем команды
    func saveTeams(teams: [Team]) {
        guard let encoded =  try? encoder.encode(teams) else { return }
        userDefaults.set(encoded, forKey: "teams")
    }
    
    /// Получаем команды, которые будут играть
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
    
    /// Проверяем, была ли ранее такая команда, если нет, то создаем новую
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
    
    /// Убираем команду из списка играющих в эту игру
    func removeTeamFromWhoPlay(_ name: String) {
        let updatedTeam = getTeams().map { team -> Team in
            if team.name == name {
                var modify = team
                modify.didPlayNextGame = !team.didPlayNextGame
                return modify
            }
            return team
        }
        saveTeams(teams: updatedTeam)
    }
    
    /// Добавляем очки команде
    func addPointToTeam(_ name: String) {
            let updatedTeam = getTeams().map { team -> Team in
                if team.name == name {
                    var modify = team
                    modify.points += 1
                    modify.pointsLifetime += 1
                    return modify
                }
                return team
            }
            saveTeams(teams: updatedTeam)
    }
}
