//
//  WrongView.swift
//  CrocodileGame
//
//  Created by Andrey on 20.04.2023.
//

import UIKit

protocol WrongViewDelegate: AnyObject {
    func WrongView(_ view: WrongView, didTapButton button: UIButton)
}

class WrongView: CustomView {
    
    weak var delegate: WrongViewDelegate?
    
    private lazy var backgroundImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "background")
        image.contentMode = .scaleAspectFill
        return image
    }()
    
    private lazy var topTeamView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 10
        return view
    }()
    
    private lazy var topTeamViewAvatarBackground: UIView = {
        let view = UIView()
        view.backgroundColor = .darkGray
        view.layer.cornerRadius = 40
        return view
    }()
    
    private lazy var topTeamViewAvatar: UILabel = {
        let label = UILabel()
        label.text = "🤷🏻"
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 50)
        return label
    }()
    
    private lazy var topTeamViewName: UILabel = {
        let label = UILabel()
        label.text = ""
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 26)
        return label
    }()
    
    private var topTeamViewPointsStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        return stack
    }()
    
    private var topTeamViewPointsStackLabel1: UILabel = {
        let label = UILabel()
        label.text = ""
        label.textAlignment = .center
        label.font = UIFont.italicSystemFont(ofSize: 40)
        return label
    }()
    
    private var topTeamViewPointsStackLabel2: UILabel = {
        let label = UILabel()
        label.text = "Очки"
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 18)
        return label
    }()
    
    private lazy var greenCentralView: UIView = {
        let view = UIView()
        view.backgroundColor = CrocodileColors.red.setColor
        view.layer.cornerRadius = 20
        return view
    }()
    
    private lazy var greenCentralViewLabel1: UILabel = {
        let label = UILabel()
        label.text = "УВЫ И АХ!"
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 32)
        return label
    }()
    
    private lazy var greenCentralViewLabel2: UILabel = {
        let label = UILabel()
        label.text = "Вы не отгадали слово и не получаете очков"
        label.numberOfLines = 0
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 16)
        return label
    }()
    
    private lazy var greenCentralViewStar: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "circle")
        image.contentMode = .scaleAspectFill
        return image
    }()
    
    private lazy var greenCentralViewNumberInStar: UILabel = {
        let label = UILabel()
        label.text = "0"
        label.textAlignment = .center
        label.textColor = .white
        label.font = UIFont.italicSystemFont(ofSize: 50)
        return label
    }()
    
    private lazy var greenCentralViewLabel3: UILabel = {
        let label = UILabel()
        label.text = "Следующий ход - "
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 16)
        return label
    }()
    
    private lazy var nextTeamButton: UIButton = {
        let button = UIButton()
        button.restorationIdentifier = "NextTeam"
        button.backgroundColor = CrocodileColors.greenButton.setColor
        button.layer.cornerRadius = 15
        button.setTitle("Передать ход", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 25)
        return button
    }()
    
    override func setViews() {
        super.setViews()
        
        self.addSubview(backgroundImage)
        self.addSubview(topTeamView)
        self.addSubview(topTeamViewAvatarBackground)
        self.addSubview(topTeamViewAvatar)
        self.addSubview(topTeamViewName)
        self.addSubview(topTeamViewPointsStack)
        self.addSubview(greenCentralView)
        self.addSubview(greenCentralViewLabel1)
        self.addSubview(greenCentralViewLabel2)
        self.addSubview(greenCentralViewStar)
        self.addSubview(greenCentralViewNumberInStar)
        self.addSubview(greenCentralViewLabel3)
        self.addSubview(nextTeamButton)
        
        topTeamViewPointsStack.addArrangedSubview(topTeamViewPointsStackLabel1)
        topTeamViewPointsStack.addArrangedSubview(topTeamViewPointsStackLabel2)
        
        nextTeamButton.addTarget(self, action: #selector(didTapButton(_:)), for: .touchUpInside)
    }
    
    override func layoutViews() {
        super.layoutViews()
        
        backgroundImage.translatesAutoresizingMaskIntoConstraints = false
        topTeamView.translatesAutoresizingMaskIntoConstraints = false
        topTeamViewAvatar.translatesAutoresizingMaskIntoConstraints = false
        topTeamViewAvatarBackground.translatesAutoresizingMaskIntoConstraints = false
        topTeamViewName.translatesAutoresizingMaskIntoConstraints = false
        topTeamViewPointsStack.translatesAutoresizingMaskIntoConstraints = false
        greenCentralView.translatesAutoresizingMaskIntoConstraints = false
        greenCentralViewLabel1.translatesAutoresizingMaskIntoConstraints = false
        greenCentralViewLabel2.translatesAutoresizingMaskIntoConstraints = false
        greenCentralViewStar.translatesAutoresizingMaskIntoConstraints = false
        greenCentralViewNumberInStar.translatesAutoresizingMaskIntoConstraints = false
        greenCentralViewLabel3.translatesAutoresizingMaskIntoConstraints = false
        nextTeamButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            backgroundImage.topAnchor.constraint(equalTo: self.topAnchor),
            backgroundImage.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            backgroundImage.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            backgroundImage.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            
            topTeamView.heightAnchor.constraint(equalToConstant: 100),
            topTeamView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 10),
            topTeamView.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 10),
            topTeamView.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -10),
            
            topTeamViewAvatarBackground.leadingAnchor.constraint(equalTo: topTeamView.leadingAnchor, constant: 20),
            topTeamViewAvatarBackground.centerYAnchor.constraint(equalTo: topTeamView.centerYAnchor),
            topTeamViewAvatarBackground.heightAnchor.constraint(equalToConstant: 80),
            topTeamViewAvatarBackground.widthAnchor.constraint(equalToConstant: 80),
            
            topTeamViewAvatar.centerXAnchor.constraint(equalTo: topTeamViewAvatarBackground.centerXAnchor),
            topTeamViewAvatar.centerYAnchor.constraint(equalTo: topTeamViewAvatarBackground.centerYAnchor),
            
            topTeamViewName.leadingAnchor.constraint(equalTo: topTeamViewAvatar.trailingAnchor, constant: 40),
            topTeamViewName.centerYAnchor.constraint(equalTo: topTeamView.centerYAnchor),
            
            topTeamViewPointsStack.trailingAnchor.constraint(equalTo: topTeamView.trailingAnchor, constant: -20),
            topTeamViewPointsStack.centerYAnchor.constraint(equalTo: topTeamView.centerYAnchor),
            
            greenCentralView.heightAnchor.constraint(equalToConstant: 300),
            greenCentralView.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            greenCentralView.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 10),
            greenCentralView.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -10),
            
            greenCentralViewLabel1.centerXAnchor.constraint(equalTo: greenCentralView.centerXAnchor),
            greenCentralViewLabel1.topAnchor.constraint(equalTo: greenCentralView.topAnchor, constant: 40),
            
            greenCentralViewLabel2.centerXAnchor.constraint(equalTo: greenCentralView.centerXAnchor),
            greenCentralViewLabel2.topAnchor.constraint(equalTo: greenCentralViewLabel1.bottomAnchor, constant: 25),
            
            greenCentralViewStar.centerXAnchor.constraint(equalTo: greenCentralView.centerXAnchor),
            greenCentralViewStar.topAnchor.constraint(equalTo: greenCentralViewLabel2.bottomAnchor, constant: 10),
            greenCentralViewStar.heightAnchor.constraint(equalToConstant: 100),
            greenCentralViewStar.widthAnchor.constraint(equalToConstant: 110),
            
            greenCentralViewNumberInStar.centerXAnchor.constraint(equalTo: greenCentralViewStar.centerXAnchor),
            greenCentralViewNumberInStar.centerYAnchor.constraint(equalTo: greenCentralViewStar.centerYAnchor),
            
            greenCentralViewLabel3.centerXAnchor.constraint(equalTo: greenCentralView.centerXAnchor),
            greenCentralViewLabel3.topAnchor.constraint(equalTo: greenCentralViewStar.bottomAnchor, constant: 20),
            
            nextTeamButton.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor, constant: -5),
            nextTeamButton.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 10),
            nextTeamButton.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -10),
            nextTeamButton.heightAnchor.constraint(equalToConstant: 80)
        ])
    }
    
    func setNextTeamLabel(team: String) {
        greenCentralViewLabel3.text = "Следующий ход - \"\(team)\""
    }
    
    func setTeamAvatar(icon: String, background: UIColor) {
        topTeamViewAvatar.text = icon
        topTeamViewAvatarBackground.backgroundColor = background
    }
    
    func setTeamName(name: String) {
        topTeamViewName.text = name
    }
    
    func setTeamPoints(points: Int) {
        topTeamViewPointsStackLabel1.text = String(points)
    }
    
    func setTitleButtonForLastRound() {
        nextTeamButton.setTitle("Перейти к результатам", for: .normal)
        greenCentralViewLabel3.text = ""
    }
    
}

//MARK: - Actions
private extension WrongView {
    @objc func didTapButton(_ button: UIButton) {
        delegate?.WrongView(self, didTapButton: button)
    }
}
