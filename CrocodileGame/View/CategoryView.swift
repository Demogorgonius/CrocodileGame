//
//  CategoryView.swift
//  CrocodileGame
//
//  Created by Mikhail Tedeev on 19.04.2023.
//

import UIKit

protocol CategoryViewDelegate: AnyObject {
    func startGameButton(_ button: UIButton)
    func cellDidSelected(_ indexPath: IndexPath)
}

final class CategoryView: CustomView {

    //MARK: - Property
    
    weak var delegate: CategoryViewDelegate?
    private var categories = CategoryStorage.shared.all
    
    //MARK: - UI Elements
    
    private var tableView: UITableView = {
        let tableView = UITableView()
        tableView.backgroundColor = .clear
        tableView.separatorColor = .clear
        tableView.register(CrocodileTableViewCell.self, forCellReuseIdentifier: "categoryCell")
        return tableView
    }()
    
    private lazy var startGameButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = CrocodileColors.greenButton.setColor
        button.setTitle("Начать игру", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 20)
        button.layer.cornerRadius = 10
        button.tintColor = .white
        button.addTarget(self, action: #selector(startGameTarget), for: .touchUpInside)
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
        let subviewsArray: [UIView] = [startGameButton, tableView]
        subviewsArray.forEach { ui in
            self.addSubview(ui)
            ui.translatesAutoresizingMaskIntoConstraints = false
        }
        NSLayoutConstraint.activate([
            
            //MARK: Layout PlayerReadyButton
            
            startGameButton.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor),
            startGameButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 14),
            startGameButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -14),
            startGameButton.heightAnchor.constraint(equalToConstant: 64),
            
            //MARK: Layout TableView
            
            tableView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: startGameButton.topAnchor)
            
        ])
    }
}

//MARK: - Target Actions

extension CategoryView {
    @objc private func startGameTarget(_ sender: UIButton) {
        delegate?.startGameButton(sender)
    }
}

//MARK: - UITableViewDelegate, UITableViewDataSource

extension CategoryView: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        categories.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "categoryCell", for: indexPath) as! CrocodileTableViewCell
        let category = categories[indexPath.row]
        cell.configureAsCategory(name: category.name,
                                 avatar: category.avatar,
                                 background: category.background.setColor,
                                 isSelected: category.selected)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        delegate?.cellDidSelected(indexPath)
        categories = CategoryStorage.shared.all
        tableView.reloadData()
    }
    
}
