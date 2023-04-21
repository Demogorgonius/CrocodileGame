//
//  TeamTableViewCell.swift
//  CrocodileGame
//
//  Created by Mikhail Tedeev on 18.04.2023.
//

import UIKit

protocol CrocodileTableViewCellDelegate {
    func removeTeamDidTouch(_ button: UIButton, indexPath cell: UITableViewCell)
}

class CrocodileTableViewCell: UITableViewCell {
    
    //MARK: - UI Elements
    
    private var cardBackground = UIView()
    private var avatarView = UIView()
    private var avatarLabel = UILabel()
    private var nameLabel = UILabel()
    private var removeTeamButton = UIButton()
    private var checkmarkImageView = UIImageView()
    private var scoreView = UIView()
    private var scorePointsLabel = UILabel()
    private var scoreLabel = UILabel()
    
    //MARK: - Property
    
    var delegate: CrocodileTableViewCellDelegate?
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setLayout()
        self.backgroundColor = .clear
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func configureAsTeams(name: String, avatar: String, avatarColor: UIColor) {
        setupRemoveTeamButton()
        setupAvatar(avatar: avatar, color: avatarColor)
        setupNameLabel(text: name, color: .black)
        setupCardBackground(backgroundColor: .white)
    }
    
    public func configureAsCategory(name: String, avatar: String, background: UIColor, isSelected: Bool) {
        setupAvatar(avatar: avatar, color: .white)
        setupNameLabel(text: name, color: .white)
        setupCardBackground(backgroundColor: background)
        setupCheckmarkImageView(isSelected: isSelected)
    }
    
    public func configureAsLeaderBoard(name: String, avatar: String, avatarColor: UIColor, score: Int) {
        setupAvatar(avatar: avatar, color: avatarColor)
        setupNameLabel(text: name, color: .black)
        setupCardBackground(backgroundColor: .white)
        setupScoreLabels(score: score)
    }
    
    private func setupAvatar(avatar: String, color: UIColor) {
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
    
    private func setupRemoveTeamButton() {
        removeTeamButton.setImage(UIImage(systemName: "xmark"), for: .normal)
        removeTeamButton.tintColor = .black
        removeTeamButton.addTarget(self, action: #selector(removeTeamTarget), for: .touchUpInside)
        
    }
    
    private func setupCheckmarkImageView(isSelected: Bool) {
        checkmarkImageView.image = UIImage(systemName: "checkmark.circle.fill")
        checkmarkImageView.tintColor = .white
        if isSelected {
            checkmarkImageView.isHidden = false
        } else {
            checkmarkImageView.isHidden = true
        }
    }
    
    private func setupScoreLabels(score: Int) {
        scorePointsLabel.font = .systemFont(ofSize: 40)
        scorePointsLabel.textAlignment = .center
        scorePointsLabel.text = "\(score)"
        scoreLabel.font = .systemFont(ofSize: 15)
        scoreLabel.textAlignment = .center
        scoreLabel.text = "Очки"
    }
}

//MARK: - Target Actions

extension CrocodileTableViewCell {
    @objc private func removeTeamTarget(_ sender: UIButton) {
        delegate?.removeTeamDidTouch(sender, indexPath: self)
    }
}

//MARK: - Constraints

extension CrocodileTableViewCell {
    private func setLayout() {
        let subviewsArray: [UIView] = [cardBackground, avatarView, nameLabel,
                                       avatarLabel, removeTeamButton, checkmarkImageView,
                                       scorePointsLabel, scoreLabel]
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
            
            //MARK: Layout avatarLabel
            
            avatarLabel.centerXAnchor.constraint(equalTo: avatarView.centerXAnchor),
            avatarLabel.centerYAnchor.constraint(equalTo: avatarView.centerYAnchor),
            
            //MARK: Layout nameLabel
            
            nameLabel.topAnchor.constraint(equalTo: cardBackground.topAnchor, constant: 37),
            nameLabel.leadingAnchor.constraint(equalTo: avatarView.trailingAnchor, constant: 58),
            nameLabel.bottomAnchor.constraint(equalTo: cardBackground.bottomAnchor, constant: -37),
            nameLabel.centerYAnchor.constraint(equalTo: cardBackground.centerYAnchor),
            
            //MARK: Layout removeTeamButton
            
            removeTeamButton.trailingAnchor.constraint(equalTo: cardBackground.trailingAnchor, constant: -17),
            removeTeamButton.centerYAnchor.constraint(equalTo: cardBackground.centerYAnchor),
            removeTeamButton.widthAnchor.constraint(equalToConstant: 56),
            removeTeamButton.heightAnchor.constraint(equalToConstant: 56),
            
            //MARK: Layout checkmarkImageView
            
            checkmarkImageView.trailingAnchor.constraint(equalTo: cardBackground.trailingAnchor, constant: -17),
            checkmarkImageView.centerYAnchor.constraint(equalTo: cardBackground.centerYAnchor),
            checkmarkImageView.widthAnchor.constraint(equalToConstant: 56),
            checkmarkImageView.heightAnchor.constraint(equalToConstant: 56),
            
            //MARK: Layout scorePointsLabel
            
            scorePointsLabel.topAnchor.constraint(equalTo: checkmarkImageView.topAnchor, constant: -10),
            scorePointsLabel.centerXAnchor.constraint(equalTo: checkmarkImageView.centerXAnchor),
            
            //MARK: Layout scoreView
            
            scoreLabel.bottomAnchor.constraint(equalTo: checkmarkImageView.bottomAnchor),
            scoreLabel.centerXAnchor.constraint(equalTo: checkmarkImageView.centerXAnchor),
        ])
    }
}
