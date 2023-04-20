//
//  GameResultViewController.swift
//  CrocodileGame
//
//  Created by Mikhail Tedeev on 20.04.2023.
//

import UIKit

final class GameResultViewController: CustomViewController<GameResultView> {
    
    //MARK: - Property
    
    
    
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
        navigationController?.popToRootViewController(animated: true)
    }
}
