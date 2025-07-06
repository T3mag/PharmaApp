
import UIKit

protocol ButtonsHeaderViewDelegate: AnyObject {
    func obtainFetchResultByType(fileType: FileTypes)
}

final class ButtonsHeaderView: UIView {
    
    private var delegate: ButtonsHeaderViewDelegate?
    
    private lazy var allButton: BottomBorderButton = getButton(title: "All", tag: 0, action: action, isActive: true)
    
    private lazy var videoButton: BottomBorderButton = getButton(title: "Video", tag: 1, action: action, isActive: false)
    
    private lazy var audioButton: BottomBorderButton = getButton(title: "Audio", tag: 2, action: action, isActive: false)
    
    private lazy var documentButton: BottomBorderButton = getButton(title: "Document", tag: 3, action: action, isActive: false)
    
    private lazy var action = UIAction { [weak self] sender in
        guard
            let sender = sender.sender as? UIButton,
                let self = self else { return }
        self.setTitleColor(tag: sender.tag)
        
        if sender.tag == 0 {
            delegate?.obtainFetchResultByType(fileType: .all)
        }
        if sender.tag == 1 {
            delegate?.obtainFetchResultByType(fileType: .video)
        }
        if sender.tag == 2 {
            delegate?.obtainFetchResultByType(fileType: .audio)
        }
        if sender.tag == 3 {
            delegate?.obtainFetchResultByType(fileType: .document)
        }
        
    }
    
    init(frame: CGRect, delegate: ButtonsHeaderViewDelegate) {
        super.init(frame: frame)
        self.delegate = delegate
        setupStackView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupStackView() {
        
        let stackView = UIStackView(arrangedSubviews: [
            UIView(),
            allButton,
            videoButton,
            audioButton,
            documentButton,
            UIView()
        ])
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.distribution = .fillProportionally
        stackView.alignment = .center
        stackView.backgroundColor = .clear
        stackView.isUserInteractionEnabled = true
        
        addSubview(stackView)
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(
                equalTo: safeAreaLayoutGuide.topAnchor, constant: 0),
            stackView.leadingAnchor.constraint(
                equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 20),
            stackView.trailingAnchor.constraint(
                equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -20),
            stackView.bottomAnchor.constraint(
                equalTo: safeAreaLayoutGuide.bottomAnchor, constant: 0)
        ])
    }
    
    private func getButton(title: String, tag: Int, action: UIAction, isActive: Bool) -> BottomBorderButton {
        return {
            $0.setTitle(title, for: .normal)
            $0.setTitleColor(.black, for: .normal)
            $0.titleLabel?.font = .systemFont(ofSize: 16, weight: .heavy)
            $0.heightAnchor.constraint(equalToConstant: 50).isActive = true
            $0.borderHeight = 3
            $0.isUserInteractionEnabled = true
            $0.translatesAutoresizingMaskIntoConstraints = false
            if isActive == true {
                $0.borderColor = .black
            } else {
                $0.borderColor = .gray
            }
            $0.tag = tag
            
            return $0
        }(BottomBorderButton(primaryAction: action))
    }
    
    private func setTitleColor(tag: Int) {
        [allButton, videoButton, audioButton, documentButton].forEach { btn in
            if btn.tag != tag {
                btn.borderColor = Colors.grayBlue
            } else {
                btn.borderColor = .black
            }
        }
    }
}
