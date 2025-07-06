//
//  TabBarController.swift
//  PharmaApp
//
//  Created by Артур Миннушин on 17.06.2025.
//

import UIKit

final class TabBarController: UITabBarController {
    
    // Controllers
    private lazy var mainVC = MainAssembly.screenBuilder()
    private lazy var gameVC = AllGamesAssembly.screenBuilder()
    private lazy var educateVC = EducateAssembly.screenBuilder()
    private lazy var achivmentsVC = AchievementsAssembly.screenBuilder()
    private lazy var profileVC = AccountAssembly.screenBuilder()
    
    // Buttons
    private lazy var mainButton = getButton(icon: "house", tag: 0, action: action, opacity: 1)
    private lazy var gameButton = getButton(icon: "graduationcap", tag: 1, action: action)
    private lazy var educateButton = getButton(icon: "book.closed", tag: 2, action: action)
    private lazy var achivmentButton = getButton(icon: "medal", tag: 3, action: action)
    private lazy var profileButton = getButton(icon: "person", tag: 4, action: action)
    
    
    // Action
    private lazy var action = UIAction { [weak self] sender in
        guard
            let sender = sender.sender as? UIButton,
                let self = self else { return }
        
        if sender.tag == 0 {
            navigationItem.title = "Main"
        }
        if sender.tag == 1 {
            navigationItem.title = "Game & Tests"
        }
        if sender.tag == 2 {
            navigationItem.title = "Education"
        }
        if sender.tag == 3 {
            navigationItem.title = "Acievments"
        }
        if sender.tag == 4 {
            navigationItem.title = "Profile"
        }
        
        self.selectedIndex = sender.tag
        self.setOpacity(tag: sender.tag)
    }
    
    private lazy var customBar: UIStackView = {
        $0.axis = .horizontal
        $0.distribution = .equalSpacing
        $0.alignment = .center
        $0.backgroundColor = Colors.darkGray
        $0.frame = CGRect(x: 20,
                          y: view.frame.height - 75,
                          width: view.frame.width - 40,
                          height: 50)
        $0.layer.cornerRadius = 25
        
        $0.addArrangedSubview(UIView())
        $0.addArrangedSubview(mainButton)
        $0.addArrangedSubview(gameButton)
        $0.addArrangedSubview(educateButton)
        $0.addArrangedSubview(achivmentButton)
        $0.addArrangedSubview(profileButton)
        $0.addArrangedSubview(UIView())
        
        return $0
    }(UIStackView())
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTabBar()
        setupNavBar()
    }
    
    private func setupNavBar() {
        navigationItem.title = "Main"
        navigationItem.hidesBackButton = true
        
        navigationController?.navigationBar.prefersLargeTitles = true
        self.navigationItem.largeTitleDisplayMode = .always
    }
    
    private func setupTabBar() {
        view.addSubview(customBar)
        setViewControllers([
            mainVC,
            gameVC,
            educateVC,
            achivmentsVC,
            profileVC
        ], animated: true)
        selectedIndex = 0
        tabBar.isHidden = true
    }
    
    private func getButton(icon: String, tag: Int, action: UIAction, opacity: Float = 0.5) -> UIButton {
        return {
            $0.setImage(UIImage(systemName: icon), for: .normal)
            $0.tintColor = Colors.gray
            $0.layer.opacity = opacity
            $0.tag = tag
            return $0
        }(UIButton(primaryAction: action))
    }
    
    private func setOpacity(tag: Int) {
        [mainButton, gameButton, educateButton, achivmentButton, profileButton].forEach { btn in
            if btn.tag != tag {
                btn.layer.opacity = 0.5
            } else {
                btn.layer.opacity = 1
            }
        }
    }
}
