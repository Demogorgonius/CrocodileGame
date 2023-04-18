//
//  Team.swift
//  CrocodileGame
//
//  Created by Mikhail Tedeev on 18.04.2023.
//

import UIKit

struct Team {
    let name: String
    let points: Int
    let avatar: Character
    let avatarColor: AvatarColor
}
enum AvatarColor {
    case red
    case purple
    case pink
    case yellow
    case blue
    
    var setColor: UIColor {
        switch self {
        case .red: return UIColor.systemRed
        case .purple: return UIColor.systemPurple
        case .pink: return UIColor.systemPink
        case .yellow: return UIColor.systemYellow
        case .blue: return UIColor.systemBlue
        }
    }
}
