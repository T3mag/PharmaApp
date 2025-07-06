
import UIKit

class AchievementsAssembly {
    static func screenBuilder() -> UIViewController {
        let viewController = AchievementsViewController()
        let viewModel = AchievementsViewModel()
        
        viewController.viewModel = viewModel
        viewModel.viewController = viewController
        
        return viewController
    }
}

