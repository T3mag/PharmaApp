//
//  GamesAndTestsCell.swift
//  PharmaApp
//
//  Created by Артур Миннушин on 18.06.2025.
//

import UIKit

class GamesAndTestsCell: UITableViewCell {
    
    private lazy var gameBackgroundImageView: UIImageView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.image = UIImage(named: "Cell_Background_1")
        return $0
    }(UIImageView())
    
    private lazy var gameTitleLabel: UILabel = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.text = "Название"
        $0.font = .systemFont(ofSize: 18, weight: .bold)
        $0.textColor = .white
        return $0
    }(UILabel())
    
    private lazy var gameAuthorLabel: UILabel = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.text = "Автор: T3magone"
        $0.font = .systemFont(ofSize: 15, weight: .semibold)
        $0.textColor = .white
        return $0
    }(UILabel())
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupCell()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupCellInfo(title: String, author: String) {
        gameTitleLabel.text = title
        gameAuthorLabel.text = author
    }
    
    private func setupCell() {
        addSubview(gameBackgroundImageView)
        addSubview(gameTitleLabel)
        addSubview(gameAuthorLabel)
        
        NSLayoutConstraint.activate([
            gameBackgroundImageView.topAnchor.constraint(
                equalTo: safeAreaLayoutGuide.topAnchor, constant: 5),
            gameBackgroundImageView.bottomAnchor.constraint(
                equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -5),
            gameBackgroundImageView.leadingAnchor.constraint(
                equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 5),
            gameBackgroundImageView.trailingAnchor.constraint(
                equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -5),
            gameBackgroundImageView.heightAnchor.constraint(equalToConstant: 222),
            
            gameTitleLabel.bottomAnchor.constraint(
                equalTo: gameAuthorLabel.topAnchor, constant: -5),
            gameTitleLabel.leadingAnchor.constraint(
                equalTo: gameAuthorLabel.leadingAnchor),
            gameTitleLabel.trailingAnchor.constraint(
                equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -10),
            
            gameAuthorLabel.bottomAnchor.constraint(
                equalTo: gameBackgroundImageView.bottomAnchor, constant: -10),
            gameAuthorLabel.leadingAnchor.constraint(
                equalTo: gameBackgroundImageView.leadingAnchor, constant: 10),
            gameAuthorLabel.trailingAnchor.constraint(
                equalTo: gameBackgroundImageView.trailingAnchor, constant: 10)
        ])
    }
    
}
