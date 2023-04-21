//
//  TeamView.swift
//  CrocodileGame
//
//  Created by Mikhail Tedeev on 18.04.2023.
//

import UIKit

protocol TeamViewDelegate: AnyObject {
    func didTapReadyButton(_ button: UIButton)
    func didTapAddTeamButton(_ alertController: UIAlertController)
    func didTapRemoveButton(_ button: UIButton, indexPath: IndexPath)
}

final class TeamView: CustomView {

    //MARK: - Property
    
    weak var delegate: TeamViewDelegate?
    var teamArray = TeamManager.shared.getTeamsWhoPlay()
    var teamManager = TeamManager.shared
    
    
    //MARK: - UI Elements
    
    private var tableView: UITableView = {
        let tableView = UITableView()
        tableView.backgroundColor = .clear
        tableView.separatorColor = .clear
        tableView.register(CrocodileTableViewCell.self, forCellReuseIdentifier: "teamCell")
        return tableView
    }()
    
    private var addTeamButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = CrocodileColors.orangeButton.setColor
        button.setTitle("Добавить команду", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 20)
        button.layer.cornerRadius = 10
        button.tintColor = .white
        button.addTarget(self, action: #selector(addTeamTargetTarget), for: .touchUpInside)
        return button
    }()

    private var playersReadyButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = CrocodileColors.greenButton.setColor
        button.setTitle("Игроки готовы", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 20)
        button.layer.cornerRadius = 10
        button.tintColor = .white
        button.addTarget(self, action: #selector(playersReadyTarget), for: .touchUpInside)
        return button
    }()
    
    
    override func setViews() {
        super.setViews()
        
        tableView.delegate = self
        tableView.dataSource = self
        
    }
    
    private func addBackground() {
        let background = UIImageView()
        background.image = UIImage(named: "background")
        background.frame = self.frame
        self.addSubview(background)
    }

    override func layoutSubviews() {
        addBackground()
        let subviewsArray: [UIView] = [playersReadyButton, addTeamButton, tableView]
        subviewsArray.forEach { ui in
            self.addSubview(ui)
            ui.translatesAutoresizingMaskIntoConstraints = false
        }
        NSLayoutConstraint.activate([
            
            //MARK: Layout PlayerReadyButton
            
            playersReadyButton.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor),
            playersReadyButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 14),
            playersReadyButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -14),
            playersReadyButton.heightAnchor.constraint(equalToConstant: 64),
            
            //MARK: Layout TableView
            
            addTeamButton.bottomAnchor.constraint(equalTo: playersReadyButton.topAnchor, constant: -18),
            addTeamButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 14),
            addTeamButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -14),
            addTeamButton.heightAnchor.constraint(equalToConstant: 64),
            
            //MARK: Layout TableView
            
            tableView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: addTeamButton.topAnchor)
        ])
    }
}

//MARK: - Target Actions

extension TeamView: CrocodileTableViewCellDelegate {
    func removeTeamDidTouch(_ button: UIButton, indexPath cell: UITableViewCell) {
        guard let indexPath = tableView.indexPath(for: cell) else { return }
        delegate?.didTapRemoveButton(button, indexPath: indexPath)
        teamManager.removeTeamFromWhoPlay(teamArray[indexPath.row].name)
        teamArray = teamManager.getTeamsWhoPlay()
        tableView.reloadData()
    }
    
    @objc private func playersReadyTarget(_ sender: UIButton) {
        delegate?.didTapReadyButton(sender)
    }

    @objc private func addTeamTargetTarget(_ sender: UIButton) {
        let alertSetName = UIAlertController(title: "Добавить команду", message: nil, preferredStyle: .alert)
        alertSetName.addTextField { textField in
            textField.placeholder = "Введите название команды"
        }
        let cancelAction = UIAlertAction(title: "Отменить", style: .default)
        let addTeamAction = UIAlertAction(title: "Добавить", style: .cancel) { action in
            guard let textfield = alertSetName.textFields?.first?.text else { return }
            self.teamManager.createTeam(nameTeam: textfield)
            self.teamArray = TeamManager.shared.getTeamsWhoPlay()
            self.tableView.reloadData()
        }
        alertSetName.addAction(addTeamAction)
        alertSetName.addAction(cancelAction)
        self.delegate?.didTapAddTeamButton(alertSetName)
    }
}

//MARK: - UITableViewDelegate, UITableViewDataSource

extension TeamView: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return teamArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "teamCell", for: indexPath) as! CrocodileTableViewCell
        let currentItem = teamArray[indexPath.row]
        if teamArray.count <= 2 {
            cell.configureAsTeams(name: currentItem.name,
                                  avatar: currentItem.avatar,
                                  avatarColor: currentItem.avatarColor.setColor,
                                  removeIsHidden: true)
        } else {
            cell.configureAsTeams(name: currentItem.name,
                                  avatar: currentItem.avatar,
                                  avatarColor: currentItem.avatarColor.setColor,
                                  removeIsHidden: false)
        }
        cell.delegate = self
        return cell
    }
    
    
}
