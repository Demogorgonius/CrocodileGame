//
//  ResultView.swift
//  CrocodileGame
//
//  Created by Mikhail Tedeev on 21.04.2023.
//

import UIKit
final class ResultView: CustomView {

    //MARK: - Property
    
    let teams = ResultViewController().resultOfTeams
    
    //MARK: - UI Elements
    
    private var tableView: UITableView = {
        let tableView = UITableView()
        tableView.backgroundColor = .clear
        tableView.separatorColor = .clear
        tableView.register(CrocodileTableViewCell.self, forCellReuseIdentifier: "gameResultCell")
        return tableView
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
    
    //MARK: Layout
    override func layoutSubviews() {
        addBackground()
        self.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
}

//MARK: - UITableViewDelegate, UITableViewDataSource

extension ResultView: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        teams.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "gameResultCell", for: indexPath) as! CrocodileTableViewCell
        let currentItem = teams[indexPath.row]
        cell.configureAsLeaderBoard(name: currentItem.name,
                                    avatar: currentItem.avatar,
                                    avatarColor: currentItem.avatarColor.setColor,
                                    score: currentItem.pointsLifetime)
        return cell
    }
    
    func tableView(_ tableView: UITableView, shouldHighlightRowAt indexPath: IndexPath) -> Bool {
        false
    }
}
