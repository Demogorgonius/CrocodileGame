//
//  RightViewController.swift
//  CrocodileGame
//
//  Created by Andrey on 19.04.2023.
//

import UIKit

class RightViewController: CustomViewController<RightView> {
    
    var gameManager: GameManager? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.hidesBackButton = true
        customView.delegate = self
        
        customView.setTeamAvatar(icon: (gameManager?.getCurrentTeam().avatar)!, background: (gameManager?.getCurrentTeam().avatarColor.setColor)!)
        customView.setTeamName(name: (gameManager?.getCurrentTeam().name)!)
        customView.setTeamPoints(points: (gameManager?.getCurrentTeam().points)!)
        customView.setNextTeamLabel(team: (gameManager?.getNextTeam().name)!)
    }
    
}

extension RightViewController: RightViewDelegate {
    func RightView(_ view: RightView, didTapButton button: UIButton) {
        let buttonIdentifier = button.restorationIdentifier ?? ""
        
        if buttonIdentifier == "NextTeam" {
            
            if !(gameManager?.isLastRound)! {
                gameManager?.changeTeam()
                navigationController?.popToRootViewController(animated: true)
                // Move to GameViewController
            } else {
                print("Game finished")
                // Move to GameResultViewController
            }
            
        }
    }
}
