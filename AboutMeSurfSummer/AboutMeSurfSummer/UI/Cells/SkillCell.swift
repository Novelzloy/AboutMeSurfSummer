//
//  SkillCell.swift
//  AboutMeSurfSummer
//
//  Created by Роман on 1.08.23.
//

import UIKit

class SkillCell: UICollectionViewCell {
    private lazy var skillNameLabel: UILabel = {
        let skillNameLabel = UILabel()
        skillNameLabel.translatesAutoresizingMaskIntoConstraints = false
        skillNameLabel.textAlignment = .center
        skillNameLabel.numberOfLines = 1
        skillNameLabel.font = .systemFont(ofSize: 14)
        skillNameLabel.textColor = .init(hex: 0x313131)
        return skillNameLabel
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .init(hex: 0xF3F3F5)
        layer.masksToBounds = true
        layer.cornerRadius = 12
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(title: String) {
        skillNameLabel.text = title
    }
    
    private func setupViews() {
        contentView.addSubview(skillNameLabel)
        NSLayoutConstraint.activate([
            skillNameLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 24),
            skillNameLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 12),
            contentView.bottomAnchor.constraint(equalTo: skillNameLabel.bottomAnchor, constant: 12),
            contentView.rightAnchor.constraint(equalTo: skillNameLabel.rightAnchor, constant: 24)
        ])
    }
}
