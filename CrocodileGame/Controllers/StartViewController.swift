//
//  StartViewController.swift
//  CrocodileGame
//
//  Created by Sergey on 16.04.2023.
//

import UIKit

class StartViewController: UIViewController {
    

    lazy var backgroundImage: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "background")
        return imageView
        
    }()
    
    lazy var startButton: UIButton = {
        let element = UIButton(type: .system)
        element.backgroundColor = UIColor(red: 0.45, green: 0.65, blue: 0.19, alpha: 1.00)
        element.tintColor = .white
        element.setTitle("Старт игры", for: .normal)
        element.layer.cornerRadius = 10
        element.addTarget(self, action: #selector(startButtonTapped), for: .touchUpInside)
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
        
    }()
    
    lazy var buttonStackView: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.spacing = 18
        return stack
        
    }()
    
    lazy var rulesButton: UIButton = {
        let element = UIButton(type: .system)
        element.backgroundColor = UIColor(red: 0.45, green: 0.65, blue: 0.19, alpha: 1.00)
        element.tintColor = .white
        element.setTitle("Правила", for: .normal)
        element.heightAnchor.constraint(equalToConstant: 63).isActive = true
        element.layer.cornerRadius = 10
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()
    
    lazy var resultButton: UIButton = {
        let element = UIButton(type: .system)
        element.backgroundColor = UIColor(red: 0.98, green: 0.47, blue: 0.00, alpha: 1.00)
        element.tintColor = .white
        element.setTitle("Результаты", for: .normal)
        element.heightAnchor.constraint(equalToConstant: 63).isActive = true
        element.layer.cornerRadius = 10
        element.addTarget(self, action: #selector(resultButtonTapped), for: .touchUpInside)
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()
    
    lazy var crocodileImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "pngwing 1")
        return imageView
    }()
    
    lazy var grassImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "grass 1")
        imageView.heightAnchor.constraint(equalToConstant: 70).isActive = true
        imageView.widthAnchor.constraint(equalToConstant: 95).isActive = true
        return imageView
        
    }()
    
    lazy var grassImageViewTwo: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "grass 1")
        imageView.heightAnchor.constraint(equalToConstant: 70).isActive = true
        imageView.widthAnchor.constraint(equalToConstant: 95).isActive = true
        return imageView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpView()
        
        setUpConstrain()
        setupNavigationBar(textLabel: "")
        
    }
    
    @objc func startButtonTapped(){
        print("Tapped")
        if let navigationVC = navigationController {
            let teamVC = TeamViewController()
            navigationVC.pushViewController(teamVC, animated: true)
        }
    }
    
    @objc func resultButtonTapped(_ sender: UIButton) {
        if let navigationVC = navigationController {
            let resultVC = ResultViewController()
            navigationVC.pushViewController(resultVC, animated: true)
        }
    }
    
    func setUpView(){
        view.addSubview(backgroundImage)
        view.addSubview(crocodileImageView)
        view.addSubview(grassImageView)
        view.addSubview(grassImageViewTwo)
        view.addSubview(startButton)
        view.addSubview(buttonStackView)
        buttonStackView.addArrangedSubview(rulesButton)
        buttonStackView.addArrangedSubview(resultButton)
    
    }
    
    
    func setUpConstrain(){
        NSLayoutConstraint.activate([
            backgroundImage.topAnchor.constraint(equalTo: view.topAnchor),
            backgroundImage.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            backgroundImage.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            backgroundImage.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        NSLayoutConstraint.activate([
            crocodileImageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 103),
            crocodileImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 53),
            crocodileImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -53),
            
        ])
        
        NSLayoutConstraint.activate([
            startButton.topAnchor.constraint(equalTo: crocodileImageView.bottomAnchor, constant: 54),
            startButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            startButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
            startButton.heightAnchor.constraint(equalToConstant: 83)
            
        ])
        
        NSLayoutConstraint.activate([
            buttonStackView.topAnchor.constraint(equalTo: startButton.bottomAnchor,constant: 23),
            buttonStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 82),
            buttonStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -82),
            buttonStackView.bottomAnchor.constraint(equalTo: grassImageView.topAnchor,constant: -17)
        ])
        
        NSLayoutConstraint.activate([
            
            grassImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: -3),
            
            grassImageView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -1),
            
            
        ])
        NSLayoutConstraint.activate([
            
            grassImageViewTwo.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: 3),
            grassImageViewTwo.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -1),
            
        ])
    }
    
}

