//
//  Main_ViewModel.swift
//  PharmaApp
//
//  Created by Артур Миннушин on 13.06.2025.
//

import UIKit
import CoreData

protocol MaterialViewModelInput: AnyObject {
    func getEducationMaterialsFetch(fileType: FileTypes) -> NSFetchedResultsController<EducationMaterials>
}

protocol MaterialViewModelOutput: AnyObject {
    
}

class MaterialViewModel: MaterialViewModelInput {
    
    weak var viewController: MaterialViewModelOutput?
    private let coreData = CoreDataManager.shared
    
    func getEducationMaterialsFetch(fileType: FileTypes) -> NSFetchedResultsController<EducationMaterials> {
        return coreData.getEducationMaterialsFetchResultController(fileType: fileType)
    }
}
