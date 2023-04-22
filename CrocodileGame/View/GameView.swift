//
//  GameView.swift
//  CrocodileGame
//
//  Created by Andrey on 18.04.2023.
//

import UIKit

protocol GameViewDelegate: AnyObject {
    func GameView(_ view: GameView, didTapButton button: UIButton)
}

class GameView: CustomView {
    
    weak var delegate: GameViewDelegate?
    
    private lazy var backgroundImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "background")
        image.contentMode = .scaleAspectFill
        return image
    }()
    
    private lazy var crocodileIcon: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "crocodileGameViewIcon.png")
        image.contentMode = .scaleAspectFill
        return image
    }()
    
    private lazy var timerLabel: UILabel = {
        let label = UILabel()
        label.text = "01:00"
        label.textAlignment = .center
        label.font = UIFont.italicSystemFont(ofSize: 48)
        return label
    }()
    
    private lazy var taskVStackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.alignment = .center
        stack.distribution = .fillEqually
        stack.spacing = 10
        return stack
    }()
    
    private lazy var targetWordLabel: UILabel = {
        let label = UILabel()
        label.text = "Картошка"
        label.font = UIFont.italicSystemFont(ofSize: 48)
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 0.5
        return label
    }()
    
    private lazy var conditionalsLabel: UILabel = {
        let label = UILabel()
        label.text = "объясни с помощью жестов"
        label.numberOfLines = 0
        label.textAlignment = .center
        label.font = UIFont.italicSystemFont(ofSize: 24)
        return label
    }()
    
    private lazy var buttonsVStackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.distribution = .fillEqually
        stack.spacing = 10
        return stack
    }()
    
    private lazy var rightButton: UIButton = {
        let button = UIButton()
        button.restorationIdentifier = "Right"
        button.backgroundColor = CrocodileColors.greenButton.setColor
        button.layer.cornerRadius = 15
        button.setTitle("Правильно", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 25)
        return button
    }()
    
    private lazy var wrongButton: UIButton = {
        let button = UIButton()
        button.restorationIdentifier = "Wrong"
        button.backgroundColor = .red
        button.layer.cornerRadius = 15
        button.setTitle("Нарушил правила", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 25)
        return button
    }()
    
    private lazy var resetButton: UIButton = {
        let button = UIButton()
        button.restorationIdentifier = "Reset"
        button.backgroundColor = .gray
        button.layer.cornerRadius = 15
        button.setTitle("Сбросить", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 25)
        return button
    }()
    
    override func setViews() {
        super.setViews()
        
        self.addSubview(backgroundImage)
        self.addSubview(crocodileIcon)
        self.addSubview(timerLabel)
        self.addSubview(taskVStackView)
        self.addSubview(buttonsVStackView)
        
        taskVStackView.addArrangedSubview(targetWordLabel)
        taskVStackView.addArrangedSubview(conditionalsLabel)
        
        buttonsVStackView.addArrangedSubview(rightButton)
        buttonsVStackView.addArrangedSubview(wrongButton)
        buttonsVStackView.addArrangedSubview(resetButton)
        
        rightButton.addTarget(self, action: #selector(didTapButton(_:)), for: .touchUpInside)
        wrongButton.addTarget(self, action: #selector(didTapButton(_:)), for: .touchUpInside)
        resetButton.addTarget(self, action: #selector(didTapButton(_:)), for: .touchUpInside)
    }
    
    override func layoutViews() {
        backgroundImage.translatesAutoresizingMaskIntoConstraints = false
        crocodileIcon.translatesAutoresizingMaskIntoConstraints = false
        timerLabel.translatesAutoresizingMaskIntoConstraints = false
        taskVStackView.translatesAutoresizingMaskIntoConstraints = false
        conditionalsLabel.translatesAutoresizingMaskIntoConstraints = false
        buttonsVStackView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            backgroundImage.topAnchor.constraint(equalTo: self.topAnchor),
            backgroundImage.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            backgroundImage.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            backgroundImage.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            
            crocodileIcon.heightAnchor.constraint(equalToConstant: 139),
            crocodileIcon.widthAnchor.constraint(equalToConstant: 139),
            crocodileIcon.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 5),
            crocodileIcon.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
            
            timerLabel.heightAnchor.constraint(equalToConstant: 50),
            timerLabel.topAnchor.constraint(equalTo: crocodileIcon.bottomAnchor, constant: 40),
            timerLabel.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 25),
            timerLabel.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -25),
            
            taskVStackView.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
            taskVStackView.centerYAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerYAnchor),
            
            conditionalsLabel.widthAnchor.constraint(equalToConstant: 200),
            
            buttonsVStackView.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 12),
            buttonsVStackView.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -12),
            buttonsVStackView.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor, constant: -10),
            buttonsVStackView.heightAnchor.constraint(equalToConstant: 230),
            
        ])
    }
    
    func setTimerLabelText(text: String) {
        timerLabel.text = text
    }
    
    func setTargetWordLabel(text: String) {
        targetWordLabel.text = text
    }
    
    func setConditionalsLabel(text: String) {
        conditionalsLabel.text = text
    }
}

// MARK: - Actions
private extension GameView {
    @objc func didTapButton(_ button: UIButton) {
        delegate?.GameView(self, didTapButton: button)
    }
    
}
