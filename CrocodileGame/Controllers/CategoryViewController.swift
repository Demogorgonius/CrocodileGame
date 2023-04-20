//
//  CategoryViewController.swift
//  CrocodileGame
//
//  Created by Mikhail Tedeev on 18.04.2023.
//

import UIKit

class CategoryViewController: CustomViewController<CategoryView> {
    
    //MARK: - Property
    
    var categories = CategoryStorage.shared.categories
    
    //MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationBar(textLabel: "Категории")
        customView.delegate = self
    }
}

//MARK: - CategoryViewDelegate

extension CategoryViewController: CategoryViewDelegate {
    func cellDidSelected(_ indexPath: IndexPath) {
        var categorySelected = categories[indexPath.row].selected
        if categorySelected {
            print(categorySelected)
            categorySelected = false
            print(categorySelected)
        } else {
            print(categorySelected)
            categorySelected = true
            print(categorySelected)
        }
    }
    
    func startGameButton(_ button: UIButton) {
        let gameResultViewController = GameResultViewController()
        navigationController?.pushViewController(gameResultViewController, animated: true)
    }
}
