//
//  AutolayoutPracticeViewController.swift
//  AutolayoutPractice
//
//  Created by Alexander Angelov on 26.04.23.
//

import UIKit

class AutolayoutPracticeViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    private var visibleSectionIndices = CellType.allCases
    private var filterData = DataGenerator.filterData()
    
    // MARK: - IBOutlets
    
    @IBOutlet private weak var tableView: UITableView!
    @IBOutlet private weak var headerView: HeaderView!
    
    // MARK: - Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.estimatedRowHeight = UITableView.automaticDimension
        tableView.rowHeight = UITableView.automaticDimension
        
        tableView.backgroundColor = .brandMainColor
        addNotificationEnteringForeground()
        
        headerView.configure(with: filterData)
        headerView.horizontalScrollView.delegate = self
        
        CellType.allCases.forEach {
            tableView.register($0.cellType)
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return visibleSectionIndices.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let identifier = CellType.allCases[indexPath.section].cellType.self.reuseIdentifier
        var cell = UITableViewCell()
        
        if visibleSectionIndices.count == 1 {
            cell = tableView.dequeueReusableCell(withIdentifier: visibleSectionIndices.first!.cellType.self.reuseIdentifier, for: indexPath)
        } else {
            cell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath)
        }
        
        switch cell {
            case let cell as PainRateCell:
                cell.collectionViewModels = DataGenerator.painRateData()
                return cell
            case let cell as BodyPainCell:
                cell.collectionViewModels = DataGenerator.bodyPainData()
                return cell
            case let cell as PainLocationCell:
                cell.collectionViewModels = DataGenerator.painLocationData()
                return cell
            default:
                break
        }
        return cell
    }
}

extension AutolayoutPracticeViewController: CustomHorizontalScrollViewDelegate {
    func didSelectView(with identifier: String) {
        guard let index = filterData.firstIndex(where: {$0.labelText == identifier}) else {
            return
        }
        if index == 0 {
            visibleSectionIndices = CellType.allCases
        } else {
            visibleSectionIndices = [CellType.allCases[index - 1]]
        }
        tableView.reloadData()
    }
}

extension AutolayoutPracticeViewController: HorizontalScrollViewDelegate, TableViewSectionFilter {
    func didSelectCell(at indexPath: Int) {
       showSection(tableView: tableView, index: indexPath)
    }
    
    func showSection(tableView: UITableView, index: Int) {
        if index == 0 {
            visibleSectionIndices = CellType.allCases
        } else if index <= CellType.allCases.count  {
            visibleSectionIndices = [CellType.allCases[index - 1]]
        }
        tableView.reloadData()
    }
}

// MARK: - Private Methods
private extension AutolayoutPracticeViewController {
    func addNotificationEnteringForeground() {
        NotificationCenter.default.addObserver(self, selector: #selector(appWillEnterForeground), name: UIApplication.willEnterForegroundNotification, object: nil)
    }
    
    @objc func appWillEnterForeground() {
        tableView.setContentOffset(.zero, animated: true)
        visibleSectionIndices = CellType.allCases
        tableView.reloadData()
        
        if let title = filterData.first?.labelText {
            headerView.horizontalScrollView.selectView(with: title)
        }
    }
}
