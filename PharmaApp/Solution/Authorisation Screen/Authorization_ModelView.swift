//
//  Authorization_ModelView.swift
//  PharmaApp
//
//  Created by Артур Миннушин on 13.06.2025.
//

import UIKit

protocol AuthorisationViewModelInput: AnyObject {
    func singInUser(email: String, password: String)
}

protocol AuthorisationViewModelOutput: AnyObject {
    
}

class AuthorisationViewModel: AuthorisationViewModelInput {
    
    weak var viewController: AuthorisationViewModelOutput?
    private let firebase = FirebaseController.singleton
    
    func singInUser(email: String, password: String) {
        firebase.sigInUser(email: email, password: password)
    }
}
