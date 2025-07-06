//
//  Authorisation_ViewController.swift
//  PharmaApp
//
//  Created by Артур Миннушин on 13.06.2025.
//

import UIKit

class AuthorisationViewController: UIViewController {

    var viewModel: AuthorisationViewModelInput?
    private let customView: AuthorisationView = .init()
    
    override func loadView() {
        view = customView
        customView.delegate = self
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
}

extension AuthorisationViewController: AuthorisationViewDelegate {
    func singInUser(email: String, password: String) {
        viewModel?.singInUser(email: email, password: password)
        let tabbarController = TabBarController()
        navigationController?.pushViewController(tabbarController, animated: true)
    }
}

extension AuthorisationViewController: AuthorisationViewModelOutput {
    
}
