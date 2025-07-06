import UIKit

protocol AllGamesViewDelegate: AnyObject {
    func openGameView()
}

class GamesView: UIView {
    
    weak var delegate: AllGamesViewDelegate?
    
    private lazy var gamesTableView: UITableView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.backgroundColor = .clear
        $0.separatorStyle = .none
        $0.showsVerticalScrollIndicator = false
        $0.showsHorizontalScrollIndicator = false
        $0.dataSource = self
        $0.delegate = self
        
        $0.register(GamesAndTestsCell.self, forCellReuseIdentifier: "games")
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
        addSubview(gamesTableView)
        
        NSLayoutConstraint.activate([
            gamesTableView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            gamesTableView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
            gamesTableView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor),
            gamesTableView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
}

extension GamesView: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let gameCell = tableView.dequeueReusableCell(
            withIdentifier: "games", for: indexPath) as? GamesAndTestsCell else {
            fatalError()
        }
        
        gameCell.setupCellInfo(title: "Виды витаминов", author: "Артур Миннушин")
        
        return gameCell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        delegate?.openGameView()
    }
}
