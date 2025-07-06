
import UIKit

protocol AchievementsViewModelInput: AnyObject {
    
}

protocol AchievementsViewModelOutput: AnyObject {
    
}

class AchievementsViewModel: AchievementsViewModelInput {
    weak var viewController: AchievementsViewController?
}

