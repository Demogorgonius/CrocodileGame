//
//  TeamTableViewCell.swift
//  CrocodileGame
//
//  Created by Mikhail Tedeev on 18.04.2023.
//

import UIKit

class TeamTableViewCell: UITableViewCell {
    
    private var cardBackground = UIView()
    private var avatarView = UIView()
    private var avatarLabel = UILabel()
    private var nameLabel = UILabel()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupCardBackground()
        setLayout()
        self.backgroundColor = .clear
        backgroundView = nil
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func configure(name: String, avatar: Character, color: UIColor) {
        setupAvatar(avatar: avatar, color: color)
        setupNameLabel(text: name)
    }
    
    private func setupAvatar(avatar: Character, color: UIColor) {
        avatarView.layer.cornerRadius = 56 / 2
        avatarView.backgroundColor = color
        avatarView.tintColor = color
        avatarView.addSubview(avatarLabel)
        avatarLabel.text = String(avatar)
        avatarLabel.font = .systemFont(ofSize: 40)
    }
    
    private func setupNameLabel(text: String) {
        nameLabel.text = text
        nameLabel.font = .systemFont(ofSize: 20)
    }
    
    private func setupCardBackground() {
        cardBackground.layer.cornerRadius = 10
        cardBackground.backgroundColor = .systemBackground
    }
    

}

//MARK: - Constraints

extension TeamTableViewCell {
    private func setLayout() {
        let subviewsArray: [UIView] = [cardBackground, avatarView, nameLabel, avatarLabel]
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
