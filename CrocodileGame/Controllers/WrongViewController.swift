//
//  WrongViewController.swift
//  CrocodileGame
//
//  Created by Andrey on 20.04.2023.
//

import UIKit

class WrongViewController: CustomViewController<WrongView> {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.hidesBackButton = true
        customView.delegate = self
        
        customView.setTeamAvatar(icon: "🤷🏻", background: CrocodileColors.blue.setColor)
        customView.setTeamName(name: "Cowboys")
        customView.setTeamPoints(points: 1)
        customView.setNextTeamLabel(team: "Стройняшки")
    }
    
}

extension WrongViewController: WrongViewDelegate {
    func WrongView(_ view: WrongView, didTapButton button: UIButton) {
        let buttonIdentifier = button.restorationIdentifier ?? ""
        
        if buttonIdentifier == "NextTeam" {
            // Move to GameViewController
        }
    }
}

