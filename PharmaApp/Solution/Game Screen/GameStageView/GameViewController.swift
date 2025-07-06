
import UIKit

class GameViewController: UIViewController {

    var viewModel: GameViewModelInput?
    private let customView: GameStartView = .init()
    
    override func loadView() {
        view = customView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.tintColor = .white
    }

}

extension GameViewController: GameViewModelOutput {
    
}
