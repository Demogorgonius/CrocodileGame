//
//  GameResultViewController.swift
//  CrocodileGame
//
//  Created by Mikhail Tedeev on 20.04.2023.
//

import UIKit

final class GameResultViewController: CustomViewController<GameResultView> {
    
    //MARK: - Property
    
    let resultOfTeams = TeamManager.shared.getTeamsWhoPlay().sorted { $0.points > $1.points }
    
    //MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationBar(textLabel: "Результаты")
        customView.delegate = self
    }
}

//MARK: - Target Actions

extension GameResultViewController: GameResultViewDelegate {
    func didTapPlayAgainButton(_ button: UIButton) {
        let resultViewController = ResultViewController()
        navigationController?.pushViewController(resultViewController, animated: true)
    }
}
