//
//  TeamViewController.swift
//  CrocodileGame
//
//  Created by Mikhail Tedeev on 18.04.2023.
//

import UIKit

final class TeamViewController: UIViewController {
    
    //MARK: - UI Elements
    
    private var tableView = UITableView()
    private var addTeamButton = UIButton()
    private var playersReadyButton = UIButton()
    
    //MARK: - Property
    
    let cells = [
        Team(name: "Ковбои", points: 0, avatar: "🤠", avatarColor: .red),
        Team(name: "Стройняшки", points: 0, avatar: "🍔", avatarColor: .purple),
        Team(name: "Красотки", points: 0, avatar: "💅", avatarColor: .pink)
    ]
    
    //MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setLayout()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        centerTitle()
    }
}

//MARK: - Setup UI

extension TeamViewController {
    private func setupUI() {
        view.backgroundColor = UIColor(patternImage: UIImage(named: "background")!)
        title = "Кто играет?"
        navigationController?.navigationBar.prefersLargeTitles = true
        setupPlayersReadyButton()
        setupAddTeamButton()
        setupTableView()
    }
    
    func centerTitle(){
        for navItem in (self.navigationController?.navigationBar.subviews)! {
            for itemSubView in navItem.subviews {
                if let largeLabel = itemSubView as? UILabel {
                    largeLabel.center = CGPoint(x: navItem.bounds.width/2, y: navItem.bounds.height/2)
                    return;
                }
            }
        }
    }
    
    private func setupPlayersReadyButton() {
        playersReadyButton = UIButton(type: .system)
        playersReadyButton.backgroundColor = .systemGreen
        playersReadyButton.setTitle("Игроки готовы", for: .normal)
        playersReadyButton.titleLabel?.font = .systemFont(ofSize: 20)
        playersReadyButton.layer.cornerRadius = 10
        playersReadyButton.tintColor = .white
    }
    
    private func setupAddTeamButton() {
        addTeamButton = UIButton(type: .system)
        addTeamButton.backgroundColor = .systemOrange
        addTeamButton.setTitle("Добавить команду", for: .normal)
        addTeamButton.titleLabel?.font = .systemFont(ofSize: 20)
        addTeamButton.layer.cornerRadius = 10
        addTeamButton.tintColor = .white
    }
    
    private func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.backgroundColor = .clear
        tableView.separatorColor = .clear
        tableView.register(TeamTableViewCell.self, forCellReuseIdentifier: "teamCell")
        
    }
}

//MARK: - Target Actions

extension TeamViewController {
    
}

//MARK: - Delegate

extension TeamViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        cells.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "teamCell", for: indexPath) as! TeamTableViewCell
        let currentItem = cells[indexPath.row]
        cell.configure(name: currentItem.name,
                       avatar: currentItem.avatar,
                       color: currentItem.avatarColor.setColor)
        return cell
    }
    
    
}

//MARK: - Layout

extension TeamViewController {
    private func setLayout() {
        let subviewsArray: [UIView] = [playersReadyButton, addTeamButton, tableView, ]
        subviewsArray.forEach { ui in
            self.view.addSubview(ui)
            ui.translatesAutoresizingMaskIntoConstraints = false
        }
        NSLayoutConstraint.activate([
            
            //MARK: Layout PlayerReadyButton
            
            playersReadyButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            playersReadyButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 14),
            playersReadyButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -14),
            playersReadyButton.heightAnchor.constraint(equalToConstant: 64),
            
            //MARK: Layout TableView
            
            addTeamButton.bottomAnchor.constraint(equalTo: playersReadyButton.topAnchor, constant: -18),
            addTeamButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 14),
            addTeamButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -14),
            addTeamButton.heightAnchor.constraint(equalToConstant: 64),
            
            //MARK: Layout TableView
            
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: addTeamButton.topAnchor)
            
        ])
        
    }
}
