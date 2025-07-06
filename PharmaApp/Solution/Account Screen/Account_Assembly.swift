
import UIKit

class AccountAssembly {
    static func screenBuilder() -> UIViewController {
        let viewController = AccountViewController()
        let viewModel = AccountViewModel()
        
        viewController.viewModel = viewModel
        viewModel.viewController = viewController
        
        return viewController
    }
}
