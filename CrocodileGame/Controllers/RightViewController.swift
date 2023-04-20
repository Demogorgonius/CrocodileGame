//
//  RightViewController.swift
//  CrocodileGame
//
//  Created by Andrey on 19.04.2023.
//

import UIKit

class RightViewController: CustomViewController<RightView> {
    
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

extension RightViewController: RightViewDelegate {
    func RightView(_ view: RightView, didTapButton button: UIButton) {
        let buttonIdentifier = button.restorationIdentifier ?? ""
        
        if buttonIdentifier == "NextTeam" {
            // Move to GameViewController
        }
    }
}
