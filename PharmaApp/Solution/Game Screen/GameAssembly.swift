import UIKit

class GameAssembly {
    static func screenBuilder() -> UIViewController {
        let viewController = GameViewController()
        let viewModel = GameViewModel()
        
        viewController.viewModel = viewModel
        viewModel.viewController = viewController
        
        return viewController
    }
}
