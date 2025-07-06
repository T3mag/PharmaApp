
import UIKit

protocol GameViewModelInput: AnyObject {
    
}

protocol GameViewModelOutput: AnyObject {
    
}

class GameViewModel: GameViewModelInput {
    weak var viewController: GameViewModelOutput?
}
