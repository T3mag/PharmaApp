//
//  EducationCell.swift
//  PharmaApp
//
//  Created by Артур Миннушин on 18.06.2025.
//

import UIKit

class EducationCell: UITableViewCell {
    
    private lazy var fileTitleLabel: UILabel = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.text = "Название файла"
        $0.font = .systemFont(ofSize: 18, weight: .bold)
        $0.textColor = .black
        return $0
    }(UILabel())
    
    private lazy var fileDateLabel: UILabel = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.text = "Название файла"
        $0.font = .systemFont(ofSize: 14)
        $0.textColor = .black
        return $0
    }(UILabel())
    
    private lazy var fileTypeIconImageView: UIImageView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.image = UIImage(systemName: "document")
        $0.tintColor = .black
        return $0
    }(UIImageView())
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupCellLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupCellInfo(title: String, dateAdd: String, fileType: FileTypes) {
        fileTitleLabel.text = title
        fileDateLabel.text = dateAdd
        
        switch fileType {
        case .video:
            fileTypeIconImageView.image = UIImage(
                systemName: "play.square")
        case .audio:
            fileTypeIconImageView.image = UIImage(
                systemName: "waveform")
        case .document:
            fileTypeIconImageView.image = UIImage(
                systemName: "document")
        case .all:
            break
        }
    }
    
    private func setupCellLayout() {
        addSubview(fileTitleLabel)
        addSubview(fileDateLabel)
        addSubview(fileTypeIconImageView)
        
        NSLayoutConstraint.activate([
            fileTitleLabel.topAnchor.constraint(
                equalTo: safeAreaLayoutGuide.topAnchor, constant: 10),
            fileTitleLabel.leadingAnchor.constraint(
                equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 20),
            
            fileDateLabel.topAnchor.constraint(
                equalTo: fileTitleLabel.bottomAnchor, constant: 5),
            fileDateLabel.bottomAnchor.constraint(
                equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -10),
            fileDateLabel.leadingAnchor.constraint(
                equalTo: fileTitleLabel.leadingAnchor, constant: 0),
            
            fileTypeIconImageView.centerYAnchor.constraint(equalTo: safeAreaLayoutGuide.centerYAnchor),
            fileTypeIconImageView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -20),
            fileTypeIconImageView.heightAnchor.constraint(equalToConstant: 28),
            fileTypeIconImageView.widthAnchor.constraint(equalToConstant: 28)
        ])
    }
}
