//
//  Account_ViewController.swift
//  PharmaApp
//
//  Created by Артур Миннушин on 13.06.2025.
//

import UIKit

class AccountViewController: UIViewController {

    var viewModel: AccountViewModel?
    private let customView: AccountView = .init()
    
    override func loadView() {
        view = customView
        customView.delegate = self
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Profile"
    }
}

extension AccountViewController: AccountViewDelegate {
    
}

extension AccountViewController: AccountViewModelOutput {
    
}
