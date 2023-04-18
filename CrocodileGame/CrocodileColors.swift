//
//  CrocodileColors.swift
//  CrocodileGame
//
//  Created by Mikhail Tedeev on 18.04.2023.
//

import UIKit

enum CrocodileColors {
    case red
    case purple
    case pink
    case yellow
    case blue
    case orangeButton
    case greenButton
    
    var setColor: UIColor {
        switch self {
        case .red: return UIColor.systemRed
        case .purple: return UIColor.systemPurple
        case .pink: return UIColor.systemPink
        case .yellow: return UIColor.systemYellow
        case .blue: return UIColor.systemBlue
        case .orangeButton: return UIColor(red: 250/255, green: 120/255, blue: 0, alpha: 1)
        case .greenButton: return UIColor(red: 116/255, green: 167/255, blue: 48/255, alpha: 1)
        }
    }
}
