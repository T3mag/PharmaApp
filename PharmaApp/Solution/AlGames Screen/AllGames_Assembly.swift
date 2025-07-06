
import UIKit

class AllGamesAssembly {
    static func screenBuilder() -> UIViewController {
        let viewController = AllGamesViewController()
        let viewModel = AllGamesViewModel()
        
        viewController.viewModel = viewModel
        viewModel.viewController = viewController
        
        return viewController
    }
}

