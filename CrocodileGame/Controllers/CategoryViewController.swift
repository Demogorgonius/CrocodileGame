//
//  CategoryViewController.swift
//  CrocodileGame
//
//  Created by Mikhail Tedeev on 18.04.2023.
//

import UIKit

class CategoryViewController: UIViewController {
    
    //MARK: - UI Elements
    
    private var tableView = UITableView()
    private var startGameButton = UIButton()
    
    //MARK: - Property
    
    let categorys = [
        Category(name: "Животные", avatar: "🐸", background: .purple),
        Category(name: "Еда", avatar: "🍔", background: .yellow),
        Category(name: "Личности", avatar: "🤠", background: .blue),
        Category(name: "Хобби", avatar: "🎬", background: .red)
    ]
    
    //MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setLayout()
    }
}

//MARK: - Setup UI

extension CategoryViewController {
    private func setupUI() {
        view.backgroundColor = UIColor(patternImage: UIImage(named: "background")!)
        setupPlayersReadyButton()
        setupTableView()
        setupNavigationBar(textLabel: "Категории")
    }
    
    private func setupPlayersReadyButton() {
        startGameButton = UIButton(type: .system)
        startGameButton.backgroundColor = .systemGreen
        startGameButton.setTitle("Начать игру", for: .normal)
        startGameButton.titleLabel?.font = .systemFont(ofSize: 20)
        startGameButton.layer.cornerRadius = 10
        startGameButton.tintColor = .white
    }
    
    private func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.backgroundColor = .clear
        tableView.separatorColor = .clear
        tableView.register(CrocodileTableViewCell.self, forCellReuseIdentifier: "teamCell")
        
    }
}

//MARK: - Target Actions

extension CategoryViewController {
    
}

//MARK: - UITableViewDelegate, UITableViewDataSource

extension CategoryViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        categorys.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "teamCell", for: indexPath) as! CrocodileTableViewCell
        let category = categorys[indexPath.row]
        cell.configureAsCategory(name: category.name, avatar: category.avatar, background: category.background.setColor)
        return cell
    }
    
    func tableView(_ tableView: UITableView, shouldHighlightRowAt indexPath: IndexPath) -> Bool {
        false
    }
}

//MARK: - Layout

extension CategoryViewController {
    private func setLayout() {
        let subviewsArray: [UIView] = [startGameButton, tableView]
        subviewsArray.forEach { ui in
            self.view.addSubview(ui)
            ui.translatesAutoresizingMaskIntoConstraints = false
        }
        NSLayoutConstraint.activate([
            
            //MARK: Layout PlayerReadyButton
            
            startGameButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            startGameButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 14),
            startGameButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -14),
            startGameButton.heightAnchor.constraint(equalToConstant: 64),
            
            //MARK: Layout TableView
            
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: startGameButton.topAnchor)
            
        ])
        
    }
}
