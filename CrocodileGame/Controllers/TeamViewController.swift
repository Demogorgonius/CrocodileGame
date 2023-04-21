//
//  TeamViewController.swift
//  CrocodileGame
//
//  Created by Mikhail Tedeev on 18.04.2023.
//

import UIKit

final class TeamViewController: CustomViewController<TeamView> {
    
    //MARK: - Property
    
    let teams = TeamManager.shared
    
    
    //MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationBar(textLabel: "Кто играет?")
        customView.delegate = self
    }
}

//MARK: - Target Actions

extension TeamViewController: TeamViewDelegate {
    func didTapRemoveButton(_ button: UIButton, indexPath: IndexPath) {
        print("kek")
    }
    
    func didTapReadyButton(_ button: UIButton) {
        print("ready")
        let categoryViewController = CategoryViewController()
        navigationController?.pushViewController(categoryViewController, animated: true)
    }
    
    func didTapAddTeamButton(_ button: UIButton) {
        teams.createTeam(nameTeam: "test")
    }
}
