//
//  AchievmentsCell.swift
//  PharmaApp
//
//  Created by Артур Миннушин on 18.06.2025.
//

import UIKit

class AchievmentsCell: UITableViewCell {
    
    private lazy var achievmentImageView: UIImageView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.image = UIImage(named: "Cup")
        return $0
    }(UIImageView())
    
    private lazy var achievmentTitleLabel: UILabel = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.text = "Название"
        $0.font = .systemFont(ofSize: 16, weight: .bold)
        $0.textColor = .black
        return $0
    }(UILabel())
    
    private lazy var achievmentDescriptionLabel: UILabel = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.text = "Описание"
        $0.font = .systemFont(ofSize: 14)
        $0.numberOfLines = 10
        return $0
    }(UILabel())
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupCell()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupCellInfo(title: String, description: String) {
        achievmentTitleLabel.text = title
        achievmentDescriptionLabel.text = description
    }
    
    private func setupCell() {
        addSubview(achievmentImageView)
        addSubview(achievmentTitleLabel)
        addSubview(achievmentDescriptionLabel)
        
        NSLayoutConstraint.activate([
            achievmentImageView.topAnchor.constraint(
                equalTo: safeAreaLayoutGuide.topAnchor, constant: 10),
            achievmentImageView.leadingAnchor.constraint(
                equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 20),
            achievmentImageView.heightAnchor.constraint(equalToConstant: 48),
            achievmentImageView.widthAnchor.constraint(equalToConstant: 48),
            achievmentImageView.bottomAnchor.constraint(
                equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -10),
            
            achievmentTitleLabel.topAnchor.constraint(
                equalTo: safeAreaLayoutGuide.topAnchor, constant: 10),
            achievmentTitleLabel.leadingAnchor.constraint(
                equalTo: achievmentImageView.trailingAnchor, constant: 20),
            achievmentTitleLabel.trailingAnchor.constraint(
                equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -20),
            
            achievmentDescriptionLabel.topAnchor.constraint(
                equalTo: achievmentTitleLabel.bottomAnchor, constant: -10),
            achievmentDescriptionLabel.leadingAnchor.constraint(
                equalTo: achievmentTitleLabel.leadingAnchor),
            achievmentDescriptionLabel.trailingAnchor.constraint(
                equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -20),
            achievmentDescriptionLabel.bottomAnchor.constraint(
                equalTo: safeAreaLayoutGuide.bottomAnchor),
        ])
    }
}
