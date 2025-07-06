import UIKit

protocol AccountViewModelInput: AnyObject {
    
}

protocol AccountViewModelOutput: AnyObject {
    
}

class AccountViewModel: AccountViewModelInput {
    weak var viewController: AccountViewModelOutput?
}
