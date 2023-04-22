//
//  CategoryViewController.swift
//  CrocodileGame
//
//  Created by Mikhail Tedeev on 18.04.2023.
//

import UIKit

final class CategoryViewController: CustomViewController<CategoryView> {
    
    //MARK: - Property
    
    var categories = CategoryStorage.shared
    
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
        
        if categories.all[indexPath.row].selected {
            categories.changeSelection(name: categories.all[indexPath.row].name,
                                       isSelected: false)
        } else {
            categories.changeSelection(name: categories.all[indexPath.row].name,
                                       isSelected: true)
        }
    }
    
    func startGameButton(_ button: UIButton) {
        guard !categories.getWordsForGame().isEmpty else { return }
        let gameViewController = GameViewController()
        navigationController?.pushViewController(gameViewController, animated: true)
    }
}
