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
    func didTapRenameCell(_ alertController: UIAlertController) {
        present(alertController, animated: true)
    }
    
    func didTapAddTeamButton(_ alertController: UIAlertController) {
        present(alertController, animated: true)
    }
    
    func didTapRemoveButton(_ button: UIButton, indexPath: IndexPath) {
    }
    
    func didTapReadyButton(_ button: UIButton) {
        let categoryViewController = CategoryViewController()
        navigationController?.pushViewController(categoryViewController, animated: true)
    }
}
