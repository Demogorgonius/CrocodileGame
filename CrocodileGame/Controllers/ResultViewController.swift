//
//  ResultViewController.swift
//  CrocodileGame
//
//  Created by Mikhail Tedeev on 21.04.2023.
//

import UIKit

final class ResultViewController: CustomViewController<ResultView> {
    
    //MARK: - Property
    
    let resultOfTeams = TeamManager.shared.getTeams().sorted { $0.points > $1.points }
    
    //MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationBar(textLabel: "Таблица лидеров")
    }
}
