//
//  GameResultView.swift
//  CrocodileGame
//
//  Created by Mikhail Tedeev on 20.04.2023.
//

import UIKit

protocol GameResultViewDelegate: AnyObject {
    func didTapPlayAgainButton(_ button: UIButton)
}

final class GameResultView: CustomView {

    //MARK: - Property
    
    weak var delegate: GameResultViewDelegate?
    let teams = GameResultViewController().resultOfTeams
    
    //MARK: - UI Elements
    
    private var tableView: UITableView = {
        let tableView = UITableView()
        tableView.backgroundColor = .clear
        tableView.separatorColor = .clear
        tableView.register(CrocodileTableViewCell.self, forCellReuseIdentifier: "gameResultCell")
        return tableView
    }()
    
    private lazy var playAgainButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = CrocodileColors.orangeButton.setColor
        button.setTitle("Играть сначала", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 20)
        button.layer.cornerRadius = 10
        button.tintColor = .white
        button.addTarget(self, action: #selector(playAgainTarget), for: .touchUpInside)

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
        let subviewsArray: [UIView] = [playAgainButton, tableView]
        subviewsArray.forEach { ui in
            self.addSubview(ui)
            ui.translatesAutoresizingMaskIntoConstraints = false
        }
        NSLayoutConstraint.activate([
            
            //MARK: Layout PlayerReadyButton
            
            playAgainButton.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor),
            playAgainButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 14),
            playAgainButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -14),
            playAgainButton.heightAnchor.constraint(equalToConstant: 64),
            
            //MARK: Layout TableView
            
            tableView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: playAgainButton.topAnchor)
            
        ])
        
    }
}

//MARK: - Target Actions

extension GameResultView {
    @objc private func playAgainTarget(_ sender: UIButton) {
        delegate?.didTapPlayAgainButton(sender)
    }
}

//MARK: - UITableViewDelegate, UITableViewDataSource

extension GameResultView: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        teams.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "gameResultCell", for: indexPath) as! CrocodileTableViewCell
        let currentItem = teams[indexPath.row]
        cell.configureAsLeaderBoard(name: currentItem.name,
                                    avatar: currentItem.avatar,
                                    avatarColor: currentItem.avatarColor.setColor,
                                    score: currentItem.points)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, shouldHighlightRowAt indexPath: IndexPath) -> Bool {
        false
    }
}
