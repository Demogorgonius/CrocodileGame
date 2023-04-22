//
//  ViewController.swift
//  CrocodileGame
//
//  Created by Sergey on 16.04.2023.
//

import UIKit

class CustomViewController<V: CustomView>: UIViewController {
    override func loadView() {
        view = V()
    }
    
    var customView: V {
        return view as! V
    }
}

extension UIViewController {
    func setupNavigationBar(textLabel: String) {
        let label = UILabel()
        label.textColor = .black
        label.text = textLabel
        label.font = .boldSystemFont(ofSize: 34)
        label.textAlignment = .center
        navigationItem.titleView = label
        navigationItem.backButtonTitle = ""
        navigationController?.navigationBar.tintColor = .black
    }
    
    func addBackground() {
        let background = UIImageView()
        background.image = UIImage(named: "background")
        background.frame = view.frame
        view.addSubview(background)
    }
}
