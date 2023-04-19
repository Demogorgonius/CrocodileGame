//
//  CategoryViewController.swift
//  CrocodileGame
//
//  Created by Mikhail Tedeev on 18.04.2023.
//

import UIKit

class CategoryViewController: CustomViewController<CategoryView> {
    
    //MARK: - UI Elements
    
    private var tableView = UITableView()
    private var startGameButton = UIButton()
    
    //MARK: - Property
    
    let categories = [
        Category(name: "Животные", avatar: "🐸", selected: false, background: .purple, names: [""]),
        Category(name: "Еда", avatar: "🍔", selected: true, background: .yellow, names: [""]),
        Category(name: "Личности", avatar: "🤠", selected: false, background: .blue, names: [""]),
        Category(name: "Хобби", avatar: "🎬", selected: false, background: .red, names: [""])
    ]
    
    //MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

//MARK: - Target Actions

extension CategoryViewController {
    
}
