
import UIKit

protocol AuthorisationViewDelegate: AnyObject {
    func singInUser(email: String, password: String)
}

class AuthorisationView: UIView {
    
    weak var delegate: AuthorisationViewDelegate?
    
    private lazy var logInTitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Login in your Account"
        label.font = .systemFont(ofSize: 28, weight: .medium)
        label.textAlignment = .center
        return label
    }()
    
    private var logInEmailTextFieldTitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Email"
        label.font = .systemFont(ofSize: 16, weight: .medium)
        label.textColor = .black
        return label
    }()
    
    private lazy var logInEmailTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "Your email"
        textField.layer.cornerRadius = 100
        textField.borderStyle = .roundedRect
        textField.autocapitalizationType = .none
        textField.keyboardType = .emailAddress
        textField.backgroundColor = Colors.gray
        textField.heightAnchor.constraint(equalToConstant: 56).isActive = true
        return textField
    }()
    
    private lazy var logInPasswordTextFieldTitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Password"
        label.font = .systemFont(ofSize: 16, weight: .medium)
        label.textColor = .black
        return label
    }()
    
    private lazy var logInPasswordTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.layer.cornerRadius = textField.bounds.height / 4
        textField.placeholder = "Your password"
        textField.borderStyle = .roundedRect
        textField.isSecureTextEntry = true
        textField.backgroundColor = Colors.gray
        textField.heightAnchor.constraint(equalToConstant: 56).isActive = true
        return textField
    }()
    
    private lazy var logInButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Log In", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 14, weight: .medium)
        button.setTitleColor(.black, for: .normal)
        button.layer.cornerRadius = 10
        button.backgroundColor = Colors.gray
        button.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        let action = UIAction { _ in
            let email = self.logInEmailTextField.text ?? ""
            let password = self.logInPasswordTextField.text ?? ""
            
            self.delegate?.singInUser(email: email, password: password)
        }
        
        button.addAction(action, for: .touchUpInside)
        return button
    }()
    
    private lazy var sigUpButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Sign Up", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 14, weight: .medium)
        button.setTitleColor(.black, for: .normal)
        button.layer.cornerRadius = 10
        button.backgroundColor = Colors.gray
        button.heightAnchor.constraint(equalToConstant: 40).isActive = true
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupScreen()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupScreen() {
        backgroundColor = .white
        let inputStackView = setupInputStackView()
        let buttonStackView = setupButtontStackView()
        
        let stackView = UIStackView(arrangedSubviews: [
            logInTitleLabel,
            inputStackView,
            buttonStackView,
        ])
        stackView.setCustomSpacing(50, after: inputStackView)
        stackView.axis = .vertical
        stackView.alignment = .fill
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
    
    private func setupInputStackView() -> UIStackView {
        let stackView = UIStackView(arrangedSubviews: [
            logInEmailTextFieldTitleLabel,
            logInEmailTextField,
            logInPasswordTextFieldTitleLabel,
            logInPasswordTextField
        ])
        stackView.setCustomSpacing(24, after: logInEmailTextField)
        stackView.axis = .vertical
        stackView.spacing = 10
        stackView.alignment = .fill
        return stackView
    }
    
    private func setupButtontStackView() -> UIStackView {
        let stackView = UIStackView(arrangedSubviews: [
            logInButton,
            sigUpButton,
        ])
        stackView.axis = .vertical
        stackView.spacing = 12
        stackView.alignment = .fill
        stackView.distribution = .fillEqually
        return stackView
    }

}
