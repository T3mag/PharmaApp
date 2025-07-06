import UIKit
import CoreData
import Combine

final class CoreDataManager {
    
    static let shared = CoreDataManager()
    
    private lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "PharmaApp")
        
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()
    
    /// Работа с mainViewContext
    private var viewContext: NSManagedObjectContext {
        return persistentContainer.viewContext
    }
    
    /// Работа с backgroundViewContext
    private var backgroundContext: NSManagedObjectContext {
        return persistentContainer.newBackgroundContext()
    }
    
    /// Это надо
    private init() {}
    
    /// Сохранение context
    func saveContext () {
        if viewContext.hasChanges {
            do {
                try viewContext.save()
            } catch {
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
    
    func getEducationMaterialsFetchResultController(fileType: FileTypes) -> NSFetchedResultsController<EducationMaterials> {
//        Task {
//            await addTestEducationMaterial()
//        }
        let educationFetchRequest = EducationMaterials.fetchRequest()
        let sortDescriptor = NSSortDescriptor(key: "dateAdd", ascending: true)
        switch fileType {
        case .all:
            print()
        case .video:
            educationFetchRequest.predicate = NSPredicate(format: "docementType == %@", "video")
        case .audio:
            educationFetchRequest.predicate = NSPredicate(format: "docementType == %@", "audio")
        case .document:
            educationFetchRequest.predicate = NSPredicate(format: "docementType == %@", "document")
        }
        
        educationFetchRequest.sortDescriptors = [sortDescriptor]
        
        let resultController = NSFetchedResultsController(
            fetchRequest: educationFetchRequest,
            managedObjectContext: viewContext,
            sectionNameKeyPath: nil,
            cacheName: nil)
        
        return resultController
    }
    
    private func addTestEducationMaterial() async {
        let context = backgroundContext
        
        return await backgroundContext.perform { [unowned viewContext] in
            
            for _ in 0..<4 {
                let educationMaterial = EducationMaterials(context: context)
                educationMaterial.uuid = UUID()
                educationMaterial.title = "Видео"
                educationMaterial.dateAdd = Date()
                educationMaterial.docementType = "video"
            }
            
            for _ in 0..<5 {
                let educationMaterial = EducationMaterials(context: context)
                educationMaterial.uuid = UUID()
                educationMaterial.title = "Аудио"
                educationMaterial.dateAdd = Date()
                educationMaterial.docementType = "audio"
            }
            
            for _ in 0..<6 {
                let educationMaterial = EducationMaterials(context: context)
                educationMaterial.uuid = UUID()
                educationMaterial.title = "Документ"
                educationMaterial.dateAdd = Date()
                educationMaterial.docementType = "document"
            }
            
            do {
                try context.save()
                
                return viewContext.performAndWait {
                    do {
                        try viewContext.save()
                    } catch {
                        print("Ошибка сохранения viewConext: \(error)")
                    }
                }
            } catch {
                print("Ошибка сохранения backGroundConext: \(error)")
            }
        }
    }
}
