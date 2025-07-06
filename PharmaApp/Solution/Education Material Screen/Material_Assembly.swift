//
//  Main_Assembly.swift
//  PharmaApp
//
//  Created by Артур Миннушин on 13.06.2025.
//

import UIKit

class EducateAssembly {
    static func screenBuilder() -> UIViewController {
        let viewController = MaterialViewController()
        let viewModel = MaterialViewModel()
        
        viewController.viewModel = viewModel
        viewModel.viewController = viewController
        
        return viewController
    }
}
