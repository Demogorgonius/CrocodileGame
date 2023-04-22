//
//  Team.swift
//  CrocodileGame
//
//  Created by Mikhail Tedeev on 18.04.2023.
//

struct Team: Codable {
    let name: String
    var points: Int
    var pointsLifetime: Int
    var didPlayNextGame: Bool
    let avatar: String
    let avatarColor: CrocodileColors
}

struct TeamStorage {
    var allTeams = [
    Team(name: "Тигры",
         points: Int,
         pointsLifetime: Int,
         avatar: #imageLiteral(resourceName: "tigers1"),
         avatarColor: CrocodileColors.yellow),
    Team(name: "Акулы",
         points: Int,
         pointsLifetime: Int,
         avatar: #imageLiteral(resourceName: "sharks"),
         avatarColor: CrocodileColors.yellow),
    Team(name: "Медведи",
         points: Int,
         pointsLifetime: Int,
         avatar: #imageLiteral(resourceName: "bears"),
         avatarColor: CrocodileColors.yellow),
    ]
}
