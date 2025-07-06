
import UIKit

protocol AccountViewDelegate: AnyObject {
    
}

class AccountView: UIView {
    
    weak var delegate: AccountViewDelegate?
    
    private lazy var profileAvatarImageView: UIImageView = {
        $0.image = UIImage(systemName: "person.circle")
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.tintColor = Colors.darkGray
        $0.layer.masksToBounds = false
        $0.layer.cornerRadius = frame.height / 2
        $0.clipsToBounds = true
        
        $0.setContentHuggingPriority(.defaultHigh, for: .horizontal)
        $0.setContentCompressionResistancePriority(.defaultHigh, for: .horizontal)
        $0.heightAnchor.constraint(equalToConstant: 128).isActive = true
        $0.widthAnchor.constraint(equalToConstant: 128).isActive = true
        return $0
    }(UIImageView())
    
    private lazy var profileNameLabel: UILabel = {
        $0.text = "T3mag"
        $0.font = UIFont.systemFont(ofSize: 22, weight: .medium)
        $0.textColor = .black
        $0.textAlignment = .center
        return $0
    }(UILabel())
    
    private lazy var profileMailLabel: UILabel = {
        $0.text = "test@test.com"
        $0.font = UIFont.systemFont(ofSize: 16)
        $0.textColor = Colors.grayBlue
        $0.textAlignment = .center
        return $0
    }(UILabel())
    
    private lazy var profileDateJoinedLabel: UILabel = {
        $0.text = "Joined in 2025"
        $0.font = UIFont.systemFont(ofSize: 16)
        $0.textColor = Colors.grayBlue
        $0.textAlignment = .center
        return $0
    }(UILabel())
    
    private lazy var editProfileButton: UIButton = {
        $0.setTitle("Edit Profile", for: .normal)
        $0.titleLabel?.font = .systemFont(ofSize: 14, weight: .medium)
        $0.setTitleColor(.black, for: .normal)
        $0.layer.cornerRadius = 10
        $0.backgroundColor = Colors.gray
        $0.heightAnchor.constraint(equalToConstant: 40).isActive = true
        return $0
    }(UIButton())
    
    private lazy var personalDetailsButton: UIButton = {
        $0.setTitle("Personal Details", for: .normal)
        $0.titleLabel?.font = .systemFont(ofSize: 14, weight: .medium)
        $0.setTitleColor(.black, for: .normal)
        $0.layer.cornerRadius = 10
        $0.backgroundColor = Colors.gray
        $0.heightAnchor.constraint(equalToConstant: 40).isActive = true
        return $0
    }(UIButton())
    
    private lazy var settingsButton: UIButton = {
        $0.setTitle("Settings", for: .normal)
        $0.titleLabel?.font = .systemFont(ofSize: 14, weight: .medium)
        $0.setTitleColor(.black, for: .normal)
        $0.layer.cornerRadius = 10
        $0.backgroundColor = Colors.gray
        $0.heightAnchor.constraint(equalToConstant: 40).isActive = true
        return $0
    }(UIButton())
    
    private lazy var preferencesButton: UIButton = {
        $0.setTitle("Preferences", for: .normal)
        $0.titleLabel?.font = .systemFont(ofSize: 14, weight: .medium)
        $0.setTitleColor(.black, for: .normal)
        $0.layer.cornerRadius = 10
        $0.backgroundColor = Colors.gray
        $0.heightAnchor.constraint(equalToConstant: 40).isActive = true
        return $0
    }(UIButton())
    
    private lazy var logOutButton: UIButton = {
        $0.setTitle("Log Out", for: .normal)
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
        let infoStackView = setupInfoStackView()
        let buttonStackView = setupButonStackView()
        
        let stackView = UIStackView(arrangedSubviews: [
            infoStackView,
            buttonStackView
        ])
        
        stackView.axis = .vertical
        stackView.alignment = .fill
        stackView.distribution = .fill
        stackView.spacing = 20
        stackView.isLayoutMarginsRelativeArrangement = true
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(stackView)
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            stackView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 16),
            stackView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -16),
        ])
    }
    
    private func setupButonStackView() -> UIStackView {
        let stackView = UIStackView(arrangedSubviews: [
            editProfileButton,
            personalDetailsButton,
            settingsButton,
            preferencesButton,
            logOutButton
        ])
        
        stackView.axis = .vertical
        stackView.spacing = 12
        stackView.alignment = .fill
        
        return stackView
    }
    
    private func setupInfoStackView() -> UIStackView {
        let stackView = UIStackView(arrangedSubviews: [
            profileAvatarImageView,
            profileNameLabel,
            profileMailLabel,
            profileDateJoinedLabel
        ])
        
        stackView.axis = .vertical
        stackView.spacing = 5
        stackView.alignment = .center
        
        return stackView
    }
    
}
