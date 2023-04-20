//
//  TeamViewController.swift
//  CrocodileGame
//
//  Created by Mikhail Tedeev on 18.04.2023.
//

import UIKit

final class TeamViewController: CustomViewController<TeamView> {
    
    //MARK: - Property
    
    let teams = [
        Team(name: "Ковбои", points: 10, pointsLifetime: 0, didPlayNextGame: true, avatar: "🤠", avatarColor: .red),
        Team(name: "Стройняшки", points: 13, pointsLifetime: 0, didPlayNextGame: false, avatar: "🍔", avatarColor: .purple),
        Team(name: "Красотки", points: 4, pointsLifetime: 0, didPlayNextGame: true, avatar: "💅", avatarColor: .pink)
    ]
    
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
        print("add")
    }
}
