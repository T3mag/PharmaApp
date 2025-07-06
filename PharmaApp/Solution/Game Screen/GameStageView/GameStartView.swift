//
//  GameStartView.swift
//  PharmaApp
//
//  Created by Артур Миннушин on 19.06.2025.
//

import UIKit

class GameStartView: UIView {
    
    private lazy var testImageView: UIImageView = {
        $0.image = UIImage(named: "Cell_Background_1")
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.heightAnchor.constraint(equalTo: $0.widthAnchor, multiplier: 2.0 / 3.0).isActive = true
        $0.contentMode = .scaleAspectFill
        $0.clipsToBounds = true
        return $0
    }(UIImageView())
    
    private lazy var titleLabel: UILabel = {
        $0.text = "Название теста"
        $0.font = .systemFont(ofSize: 25, weight: .bold)
        $0.textColor = .white
        return $0
    }(UILabel())
    
    private lazy var descriptionLabel: UILabel = {
        $0.text = "Ты прошёл теорию, сделал конспекты, послушал объяснения… А теперь – время проверить, что осталось в голове на самом деле! Погрузись в мини-приключение по самопроверке: 📚🧠"
        $0.numberOfLines = 10
        $0.textAlignment = .justified
        $0.font = .systemFont(ofSize: 18, weight: .semibold)
        $0.textColor = .black
        return $0
    }(UILabel())
    
    private lazy var startGameButton: UIButton = {
        $0.setTitle("Start Game", for: .normal)
        $0.titleLabel?.font = .systemFont(ofSize: 14, weight: .medium)
        $0.setTitleColor(.black, for: .normal)
        $0.layer.cornerRadius = 10
        $0.backgroundColor = Colors.gray
        $0.heightAnchor.constraint(equalToConstant: 40).isActive = true
        return $0
    }(UIButton())
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupScreen()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupScreen() {
        backgroundColor = .white
        
        let stackView = setupTestInfoStackView()
        
        addSubview(testImageView)
        addSubview(stackView)
        
        NSLayoutConstraint.activate([
            testImageView.topAnchor.constraint(equalTo: topAnchor),
            testImageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            testImageView.trailingAnchor.constraint(equalTo: trailingAnchor),
            stackView.topAnchor.constraint(equalTo: testImageView.bottomAnchor, constant: -40),
            stackView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 16),
            stackView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -16),
        ])
    }
    
    private func setupTestInfoStackView() -> UIStackView {
        let stackView = UIStackView(arrangedSubviews: [
            titleLabel,
            descriptionLabel,
            startGameButton
        ])
        
        stackView.axis = .vertical
        stackView.spacing = 20
        stackView.alignment = .fill
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        return stackView
    }
    
}
