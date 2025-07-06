import UIKit

class AuthorisationAssembly {
    static func screenBuilder() -> UIViewController {
        let viewController = AuthorisationViewController()
        let viewModel = AuthorisationViewModel()
        
        viewController.viewModel = viewModel
        viewModel.viewController = viewController
        
        return viewController
    }
}
