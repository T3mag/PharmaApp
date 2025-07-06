
import UIKit

protocol MainViewModelInput: AnyObject {
    
}

protocol MainViewModelOutput: AnyObject {
    
}

class MainViewModel: MainViewModelInput {
    weak var viewController: MainViewModelOutput?
}
