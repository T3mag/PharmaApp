
import UIKit

protocol AchievementsViewDelegate: AnyObject {
    
}

class AchievementsView: UIView {
    
    weak var delegate: AchievementsViewDelegate?
    
    private lazy var achievmentTableView: UITableView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.backgroundColor = .clear
        $0.separatorStyle = .none
        $0.showsVerticalScrollIndicator = false
        $0.showsHorizontalScrollIndicator = false
        $0.delegate = self
        $0.dataSource = self
        
        $0.register(AchievmentsCell.self, forCellReuseIdentifier: "Achievments")
        return $0
    }(UITableView())
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupScreen()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupScreen() {
        addSubview(achievmentTableView)
        
        NSLayoutConstraint.activate([
            achievmentTableView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 0),
            achievmentTableView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 0),
            achievmentTableView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: 0),
            achievmentTableView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0)
        ])
    }
}

extension AchievementsView: UITableViewDelegate,  UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let achievmentsCell = tableView.dequeueReusableCell(
            withIdentifier: "Achievments", for: indexPath) as? AchievmentsCell else {
            fatalError()
        }
        
        achievmentsCell.setupCellInfo(
            title: "Ты - Молодец",
            description: "Пройти 1 тест")
        
        return achievmentsCell
    }
}
