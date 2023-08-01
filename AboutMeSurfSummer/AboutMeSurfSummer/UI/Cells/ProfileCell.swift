//
//  ProfileCell.swift
//  AboutMeSurfSummer
//
//  Created by Роман on 1.08.23.
//

import UIKit

class ProfileCell: UICollectionViewCell {
    private lazy var profileImageView: UIImageView = {
        let profileImageView = UIImageView()
        profileImageView.translatesAutoresizingMaskIntoConstraints = false
        profileImageView.layer.masksToBounds = true
        return profileImageView
    }()
    
    private lazy var nameLabel: UILabel = {
        let nameLabel = UILabel()
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.textAlignment = .center
        nameLabel.numberOfLines = 2
        nameLabel.font = .systemFont(ofSize: 24, weight: .bold)
        nameLabel.textColor = .init(hex: 0x313131)
        return nameLabel
    }()
    
    private lazy var descriptionLabel: UILabel = {
        let descriptionLabel = UILabel()
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        descriptionLabel.textAlignment = .center
        descriptionLabel.font = .systemFont(ofSize: 14)
        descriptionLabel.textColor = .init(hex: 0x96959B)
        return descriptionLabel
    }()
    
    private lazy var pinImageView: UIImageView = {
        let pinImageView = UIImageView(image: .pin)
        pinImageView.translatesAutoresizingMaskIntoConstraints = false
        pinImageView.contentMode = .scaleAspectFit
        return pinImageView
    }()
    
    private lazy var locationLabel: UILabel = {
        let locationLabel = UILabel()
        locationLabel.translatesAutoresizingMaskIntoConstraints = false
        locationLabel.font = .systemFont(ofSize: 14)
        locationLabel.textColor = .init(hex: 0x96959B)
        return locationLabel
    }()
    
    private lazy var locationStackView: UIStackView = {
        let locationStackView = UIStackView(arrangedSubviews: [pinImageView, locationLabel])
        locationStackView.translatesAutoresizingMaskIntoConstraints = false
        locationStackView.axis = .horizontal
        locationStackView.spacing = 2
        return locationStackView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        profileImageView.layer.cornerRadius = profileImageView.bounds.height / 2
    }
    
    func configure(with profile: Profile) {
        profileImageView.image = profile.image
        nameLabel.text = profile.name
        descriptionLabel.text = profile.description
        locationLabel.text = profile.location
        layoutIfNeeded()
    }
    
    private func setupViews() {
        contentView.addSubview(profileImageView)
        contentView.addSubview(nameLabel)
        contentView.addSubview(descriptionLabel)
        contentView.addSubview(locationStackView)
        
        NSLayoutConstraint.activate([
            profileImageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            profileImageView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            profileImageView.leftAnchor.constraint(greaterThanOrEqualTo: contentView.leftAnchor).withPriority(.defaultHigh),
            contentView.leftAnchor.constraint(greaterThanOrEqualTo: profileImageView.leftAnchor).withPriority(.defaultHigh),
            profileImageView.heightAnchor.constraint(equalToConstant: 120),
            profileImageView.widthAnchor.constraint(equalTo: profileImageView.heightAnchor),
            
            nameLabel.topAnchor.constraint(equalTo: profileImageView.bottomAnchor, constant: 16),
            nameLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            nameLabel.leftAnchor.constraint(greaterThanOrEqualTo: contentView.leftAnchor),
            contentView.rightAnchor.constraint(greaterThanOrEqualTo: nameLabel.rightAnchor),
            
            descriptionLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 4),
            descriptionLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            descriptionLabel.leftAnchor.constraint(greaterThanOrEqualTo: contentView.leftAnchor),
            contentView.rightAnchor.constraint(greaterThanOrEqualTo: descriptionLabel.rightAnchor),
            
            locationStackView.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor),
            locationStackView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            locationStackView.leftAnchor.constraint(greaterThanOrEqualTo: contentView.leftAnchor),
            contentView.rightAnchor.constraint(greaterThanOrEqualTo: locationStackView.rightAnchor),
            contentView.bottomAnchor.constraint(equalTo: locationStackView.bottomAnchor)
        ])
    }
}
