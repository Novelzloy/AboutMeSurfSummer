//
//  HeaderView.swift
//  AboutMeSurfSummer
//
//  Created by Роман on 1.08.23.
//

import UIKit

protocol HeaderViewDelegate: AnyObject {
    func headerView(header: HeaderView, actionPerformedWith button: UIButton)
}

class HeaderView: UICollectionReusableView {
    weak var delegate: HeaderViewDelegate?
    
    private lazy var headerLabel: UILabel = {
        let descriptionLabel = UILabel()
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        descriptionLabel.font = .systemFont(ofSize: 16, weight: .medium)
        descriptionLabel.textColor = .init(hex: 0x313131)
        return descriptionLabel
    }()
    
    private lazy var actionItem: UIButton = {
        let actionItem = UIButton()
        actionItem.translatesAutoresizingMaskIntoConstraints = false
        actionItem.addAction(.init { [weak self] _ in
            guard let self else { return }
            self.delegate?.headerView(header: self, actionPerformedWith: actionItem)
        }, for: .touchUpInside)
        return actionItem
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .init(hex: 0xFFFFFF)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(title: String, hasAction: Bool, actionImage: UIImage?) {
        headerLabel.text = title
        actionItem.isHidden = !hasAction
        actionItem.setImage(actionImage, for: .normal)
    }
    
    private func setupViews() {
        addSubview(headerLabel)
        addSubview(actionItem)
        
        NSLayoutConstraint.activate([
            headerLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 16),
            headerLabel.topAnchor.constraint(equalTo: topAnchor, constant: 24),
            bottomAnchor.constraint(equalTo: headerLabel.bottomAnchor, constant: 4),
            
            actionItem.leftAnchor.constraint(equalTo: headerLabel.rightAnchor, constant: 8),
            actionItem.centerYAnchor.constraint(equalTo: headerLabel.centerYAnchor),
            rightAnchor.constraint(equalTo: actionItem.rightAnchor, constant: 16)
        ])
    }
}
