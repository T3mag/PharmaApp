
import UIKit

protocol AllGamesViewModelInput: AnyObject {
    
}

protocol AllGamesViewModelOutput: AnyObject {
    
}

class AllGamesViewModel: AllGamesViewModelInput {
    weak var viewController: AllGamesViewModelOutput?
}


