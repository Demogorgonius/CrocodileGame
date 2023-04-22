//
//  WrongViewController.swift
//  CrocodileGame
//
//  Created by Andrey on 20.04.2023.
//

import UIKit

class WrongViewController: CustomViewController<WrongView> {
    
    var gameManager: GameManager? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.hidesBackButton = true
        navigationController?.interactivePopGestureRecognizer?.isEnabled = false
        customView.delegate = self
        
        customView.setTeamAvatar(icon: (gameManager?.getCurrentTeam().avatar)!, background: (gameManager?.getCurrentTeam().avatarColor.setColor)!)
        customView.setTeamName(name: (gameManager?.getCurrentTeam().name)!)
        customView.setTeamPoints(points: (gameManager?.getCurrentTeam().points)!)
        customView.setNextTeamLabel(team: (gameManager?.getNextTeam().name)!)
        
        if (gameManager?.isLastRound)! {
            customView.setTitleButtonForLastRound()
        }
    }
    
}

extension WrongViewController: WrongViewDelegate {
    func WrongView(_ view: WrongView, didTapButton button: UIButton) {
        let buttonIdentifier = button.restorationIdentifier ?? ""
        
        if buttonIdentifier == "NextTeam" {
            
            if !(gameManager?.isLastRound)! {
                gameManager?.changeTeam()
                navigationController?.popViewController(animated: true)
            } else {
                print("Game finished")
                let gameResultViewController = GameResultViewController()
                navigationController?.pushViewController(gameResultViewController, animated: true)
            }
            
        }
    }
}

