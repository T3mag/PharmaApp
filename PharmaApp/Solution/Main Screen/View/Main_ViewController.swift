
import UIKit

class MainViewController: UIViewController {

    var viewModel: MainViewModelInput?
    private let customView: MainView = .init()
    
    override func loadView() {
        view = customView
        customView.delegate = self
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Main"
    }

}

extension MainViewController: MainViewDelegate {
    
}

extension MainViewController: MainViewModelOutput {
    
}
