//
//  TeamTableViewCell.swift
//  CrocodileGame
//
//  Created by Mikhail Tedeev on 18.04.2023.
//

import UIKit

protocol CrocodileTableViewCellDelegate {
    func removeTeamTarget(indexPath cell: UITableViewCell)
}

class CrocodileTableViewCell: UITableViewCell {
    
    //MARK: - UI Elements
    
    private var cardBackground = UIView()
    private var avatarView = UIView()
    private var avatarLabel = UILabel()
    private var nameLabel = UILabel()
    private var cellAccessoryView = UIView()
    
    //MARK: - Property
    
    var delegate: CrocodileTableViewCellDelegate?
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setLayout()
        self.backgroundColor = .clear
        backgroundView = nil
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func configureAsTeams(name: String, avatar: Character, avatarColor: UIColor) {
        setupAvatar(avatar: avatar, color: avatarColor)
        setupNameLabel(text: name, color: .black)
        setupCardBackground(backgroundColor: .systemBackground)
        setupAccessoryView(type: .teams)
    }
    
    public func configureAsCategory(name: String, avatar: Character, background: UIColor) {
        setupAvatar(avatar: avatar, color: .systemBackground)
        setupNameLabel(text: name, color: .white)
        setupCardBackground(backgroundColor: background)
        setupAccessoryView(type: .category)
    }
    
    public func configureAsLeaderBoard(name: String, avatar: Character, avatarColor: UIColor, score: Int) {
        setupAvatar(avatar: avatar, color: avatarColor)
        setupNameLabel(text: name, color: .black)
        setupCardBackground(backgroundColor: .systemBackground)
        setupAccessoryView(type: .leaderBoard, score: score)
    }
    
    private func setupAvatar(avatar: Character, color: UIColor) {
        avatarView.layer.cornerRadius = 56 / 2
        avatarView.backgroundColor = color
        avatarView.tintColor = color
        avatarView.addSubview(avatarLabel)
        avatarLabel.text = String(avatar)
        avatarLabel.font = .systemFont(ofSize: 40)
    }
    
    private func setupNameLabel(text: String, color: UIColor) {
        nameLabel.text = text
        nameLabel.font = .systemFont(ofSize: 20)
        nameLabel.textColor = color
    }
    
    private func setupCardBackground(backgroundColor: UIColor) {
        cardBackground.layer.cornerRadius = 10
        cardBackground.backgroundColor = backgroundColor
    }
    
    private func setupAccessoryView(type: Accessory, score: Int? = nil) {
        switch type {
        case .teams:
            let button = UIButton(type: .system)
            button.frame = cellAccessoryView.frame
            button.setImage(UIImage(systemName: "xmark"), for: .normal)
            button.imageView?.frame = button.frame
            button.addTarget(self, action: #selector(removeTeamTarget), for: .touchUpInside)
            cellAccessoryView.addSubview(button)
            return
        case .category:
            let imageView = UIImageView()
            imageView.image = UIImage(systemName: "checkmark.circle.fill")
            imageView.tintColor = .white
            imageView.frame = cellAccessoryView.frame
            cellAccessoryView.addSubview(imageView)
            return
        case .leaderBoard:
            guard let score else { return }
            let scoreLabel = UILabel()
            scoreLabel.font = .systemFont(ofSize: 65)
            scoreLabel.text = "\(score)"
            let pointsLabel = UILabel()
            pointsLabel.font = .systemFont(ofSize: 15)
            pointsLabel.text = "Очки"
            cellAccessoryView.addSubview(scoreLabel)
            cellAccessoryView.addSubview(pointsLabel)
            return
        }
    }
    
    private enum Accessory {
        case teams
        case category
        case leaderBoard
    }
}

//MARK: - Target Actions

extension CrocodileTableViewCell {
    @objc private func removeTeamTarget() {
        print("tap")
    }
}

//MARK: - Constraints

extension CrocodileTableViewCell {
    private func setLayout() {
        let subviewsArray: [UIView] = [cardBackground, avatarView, cellAccessoryView, nameLabel, avatarLabel]
        subviewsArray.forEach { view in
            self.contentView.addSubview(view)
            view.translatesAutoresizingMaskIntoConstraints = false
        }
        NSLayoutConstraint.activate([
            
            //MARK: Layout cardBackground
            
            cardBackground.heightAnchor.constraint(equalToConstant: 96),
            cardBackground.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 14),
            cardBackground.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 14),
            cardBackground.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -14),
            cardBackground.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -14),
            
            //MARK: Layout avatarView
            
            avatarView.topAnchor.constraint(equalTo: cardBackground.topAnchor, constant: 20),
            avatarView.leadingAnchor.constraint(equalTo: cardBackground.leadingAnchor, constant: 17),
            avatarView.bottomAnchor.constraint(equalTo: cardBackground.bottomAnchor, constant: -20),
            avatarView.centerYAnchor.constraint(equalTo: cardBackground.centerYAnchor),
            avatarView.widthAnchor.constraint(equalToConstant: 56),
            avatarView.heightAnchor.constraint(equalToConstant: 56),
            
            //MARK: Layout avatarView
            
            cellAccessoryView.trailingAnchor.constraint(equalTo: cardBackground.trailingAnchor, constant: -17),
            cellAccessoryView.centerYAnchor.constraint(equalTo: cardBackground.centerYAnchor),
            cellAccessoryView.widthAnchor.constraint(equalToConstant: 56),
            cellAccessoryView.heightAnchor.constraint(equalToConstant: 56),
            
            //MARK: Layout avatarLabel
            
            avatarLabel.centerXAnchor.constraint(equalTo: avatarView.centerXAnchor),
            avatarLabel.centerYAnchor.constraint(equalTo: avatarView.centerYAnchor),
            
            //MARK: Layout nameLabel
            
            nameLabel.topAnchor.constraint(equalTo: cardBackground.topAnchor, constant: 37),
            nameLabel.leadingAnchor.constraint(equalTo: avatarView.trailingAnchor, constant: 58),
            nameLabel.bottomAnchor.constraint(equalTo: cardBackground.bottomAnchor, constant: -37),
            nameLabel.centerYAnchor.constraint(equalTo: cardBackground.centerYAnchor)
        ])
    }
}
