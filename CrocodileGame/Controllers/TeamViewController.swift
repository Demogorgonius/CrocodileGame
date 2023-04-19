//
//  TeamViewController.swift
//  CrocodileGame
//
//  Created by Mikhail Tedeev on 18.04.2023.
//

import UIKit

final class TeamViewController: CustomViewController<TeamView> {
    
    //MARK: - UI Elements
    
    private var tableView = UITableView()
    private var addTeamButton = UIButton()
    private var playersReadyButton = UIButton()
    
    //MARK: - Property
    
    let teams = [
        Team(name: "Ковбои", points: 0, pointsLifetime: 0, avatar: "🤠", avatarColor: .red),
        Team(name: "Стройняшки", points: 0, pointsLifetime: 0, avatar: "🍔", avatarColor: .purple),
        Team(name: "Красотки", points: 0, pointsLifetime: 0, avatar: "💅", avatarColor: .pink)
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
    func didTapReadyButton(_ button: UIButton) {
        print("ready")
        let categoryViewController = CategoryViewController()
        navigationController?.pushViewController(categoryViewController, animated: true)
    }
    
    func didTapAddTeamButton(_ button: UIButton) {
        print("add")
    }
}
