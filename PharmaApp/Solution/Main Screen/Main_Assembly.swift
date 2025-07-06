import UIKit

class MainAssembly {
    static func screenBuilder() -> UIViewController {
        let viewController = MainViewController()
        let viewModel = MainViewModel()
        
        viewController.viewModel = viewModel
        viewModel.viewController = viewController
        
        return viewController
    }
}

