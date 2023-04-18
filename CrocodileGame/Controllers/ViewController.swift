//
//  ViewController.swift
//  CrocodileGame
//
//  Created by Sergey on 16.04.2023.
//

import UIKit

class ViewController<V: View>: UIViewController {
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
        label.text = textLabel
        label.font = .boldSystemFont(ofSize: 34)
        label.textAlignment = .center
        navigationItem.titleView = label
        navigationItem.backButtonTitle = ""
    }
}
