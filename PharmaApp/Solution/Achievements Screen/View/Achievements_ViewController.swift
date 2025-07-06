
import UIKit

class AchievementsViewController: UIViewController {

    var viewModel: AchievementsViewModel?
    private let customView: AchievementsView = .init()
    
    override func loadView() {
        view = customView
        customView.delegate = self
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Achivments"
    }
}

extension AchievementsViewController: AchievementsViewDelegate {
    
}

extension AchievementsViewController: AchievementsViewModelOutput {
    
}
