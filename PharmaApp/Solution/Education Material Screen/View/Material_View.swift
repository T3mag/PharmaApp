
import UIKit
import CoreData

protocol MaterialViewDelegate: AnyObject {
    func getFetcresultController(fileType: FileTypes) -> NSFetchedResultsController<EducationMaterials>
}

class EducateView: UIView {

    weak var delegate: MaterialViewDelegate?
    var fetchResultController: NSFetchedResultsController<EducationMaterials>?
    
    private lazy var tableHeaderView = ButtonsHeaderView(frame: CGRect(x: 0, y: 0, width: frame.width, height: 30), delegate: self)
    
    private lazy var educationTableView: UITableView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.backgroundColor = .clear
        $0.separatorStyle = .none
        $0.showsVerticalScrollIndicator = false
        $0.showsHorizontalScrollIndicator = false
        $0.delegate = self
        $0.dataSource = self
        
        $0.tableHeaderView = tableHeaderView
        $0.register(EducationCell.self, forCellReuseIdentifier: "Education")
        return $0
    }(UITableView())

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupScreen()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupScreen() {
        
        fetchResultController = delegate?.getFetcresultController(fileType: .all)
        fetchResultController?.delegate = self
        
        addSubview(educationTableView)
        
        NSLayoutConstraint.activate([
            educationTableView.topAnchor.constraint(
                equalTo: safeAreaLayoutGuide.topAnchor),
            educationTableView.leadingAnchor.constraint(
                equalTo: safeAreaLayoutGuide.leadingAnchor),
            educationTableView.trailingAnchor.constraint(
                equalTo: safeAreaLayoutGuide.trailingAnchor),
            educationTableView.bottomAnchor.constraint(
                equalTo: bottomAnchor)
        ])
    }
    
    func updateTableWithCachedData() {
        do {
            try fetchResultController?.performFetch()
            educationTableView.reloadData()
        } catch {
            print("Запрос к Fetch провален. Ошибка: \(error)")
        }
    }
}

extension EducateView: ButtonsHeaderViewDelegate {
    func obtainFetchResultByType(fileType: FileTypes) {
        fetchResultController = delegate?.getFetcresultController(fileType: fileType)
        updateTableWithCachedData()
        print(fetchResultController?.sections?.first?.numberOfObjects ?? 0)
    }
}

extension EducateView: NSFetchedResultsControllerDelegate {
    func controller(_ controller: NSFetchedResultsController<any NSFetchRequestResult>,
                    didChange anObject: Any,
                    at indexPath: IndexPath?,
                    for type: NSFetchedResultsChangeType,
                    newIndexPath: IndexPath?) {
        switch type {
        case .insert:
            educationTableView.insertRows(at: [indexPath!], with: .automatic)
            educationTableView.reloadData()
        case .delete:
            educationTableView.deleteRows(at: [indexPath!], with: .automatic)
            educationTableView.reloadData()
        case .move:
            educationTableView.reloadData()
        case .update:
            if let cell = educationTableView.cellForRow(at: indexPath!) as? EducationCell {
                let object: EducationMaterials = controller.object(at: indexPath!) as! EducationMaterials
                
                var type: FileTypes = .document
                
                if object.docementType == "document" {
                    type = .document
                }
                if object.docementType == "audio" {
                    type = .audio
                }
                if object.docementType == "video" {
                    type = .video
                }
                
                let formatter = DateFormatter()
                formatter.dateFormat = "dd.MM.yy"
                formatter.locale = Locale(identifier: "ru_RU")

                let formatted = "добавлено: " + formatter.string(from: object.dateAdd ?? Date())
                
                cell.setupCellInfo(title: object.title ?? "", dateAdd: formatted, fileType: type)
            }
            educationTableView.reloadData()
        }
    }
}

extension EducateView: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return fetchResultController?.sections?.first?.numberOfObjects ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let educationCell = tableView.dequeueReusableCell(
            withIdentifier: "Education", for: indexPath) as? EducationCell else {
            fatalError()
        }
        
        let object = fetchResultController?.object(at: indexPath)
        
        var type: FileTypes = .document
        
        if object?.docementType == "document" {
            type = .document
        }
        if object?.docementType == "audio" {
            type = .audio
        }
        if object?.docementType == "video" {
            type = .video
        }
        
        let formatter = DateFormatter()
        formatter.dateFormat = "dd.MM.yy"
        formatter.locale = Locale(identifier: "ru_RU")

        let formatted = "добавлено: " + formatter.string(from: object?.dateAdd ?? Date())
        
        educationCell.setupCellInfo(title: object?.title ?? "", dateAdd: formatted, fileType: type)
        return educationCell
    }
}
