
import UIKit

class AllGamesViewController: UIViewController {

    var viewModel: AllGamesViewModel?
    private let customView: GamesView = .init()
    
    override func loadView() {
        view = customView
        customView.delegate = self
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Games & Tests"
    }
}

extension AllGamesViewController: AllGamesViewDelegate {
    func openGameView() {
        let viewController = GameAssembly.screenBuilder()
        navigationController?.pushViewController(viewController, animated: true)
    }
}

extension AllGamesViewController: AllGamesViewModelOutput {
    
}
