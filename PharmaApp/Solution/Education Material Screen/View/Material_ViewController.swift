//
//  Material_ViewController.swift
//  PharmaApp
//
//  Created by Артур Миннушин on 13.06.2025.
//

import UIKit
import CoreData

class MaterialViewController: UIViewController {

    var viewModel: MaterialViewModelInput?
    private lazy var customView: EducateView = .init()
    
    override func loadView() {
        customView.delegate = self
        customView.fetchResultController = viewModel?.getEducationMaterialsFetch(fileType: .all)
        customView.updateTableWithCachedData()
        view = customView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Educate"

    }

}

extension MaterialViewController: MaterialViewDelegate {
    func getFetcresultController(fileType: FileTypes) -> NSFetchedResultsController<EducationMaterials> {
        return (viewModel?.getEducationMaterialsFetch(fileType: fileType))!
    }
}

extension MaterialViewController: MaterialViewModelOutput {
    
}
