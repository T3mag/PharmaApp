import UIKit

protocol MainViewDelegate: AnyObject {
    
}

class MainView: UIView {
    
    weak var delegate: MainViewDelegate?
    
    private lazy var descriptionLabel: UILabel = {
        $0.text = "Здесь пока ничего нет, но никогда не поздно начать сначала"
        $0.numberOfLines = 10
        $0.font = .systemFont(ofSize: 18, weight: .semibold)
        $0.textColor = .black
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.textAlignment = .center
        return $0
    }(UILabel())
    
    private lazy var mainTableView: UITableView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.backgroundColor = .clear
        $0.separatorStyle = .none
        $0.showsVerticalScrollIndicator = false
        $0.showsHorizontalScrollIndicator = false
        
//        $0.register(nil, forCellReuseIdentifier: "Achievments")
        return $0
    }(UITableView())

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(descriptionLabel)
        
        NSLayoutConstraint.activate([
            descriptionLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 10),
            descriptionLabel.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 10),
            descriptionLabel.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -10)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
