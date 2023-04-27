//
//  AutolayoutPracticeViewController.swift
//  AutolayoutPractice
//
//  Created by Alexander Angelov on 26.04.23.
//

import UIKit

class AutolayoutPracticeViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    private var visibleSectionIndices = DataGenerator.filterData().enumerated().map { $0.offset }
    
    private let listOfCells = [HealthcareProvidersCell.self, AssociatedDoctorCell.self, MorningEntryCell.self, MorningPainCell.self, MovementProgressCell.self, SavedArticleCell.self, PainRateCell.self, PainMonitorCell.self, CustomPainCell.self, CustomProgressCell.self, BodyPainCell.self, PainLocationCell.self]
    
    @IBOutlet private weak var filterHorizontalScrollView: HorizontalScrollView!
    @IBOutlet private weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.estimatedRowHeight = UITableView.automaticDimension
        tableView.rowHeight = UITableView.automaticDimension
        
        tableView.backgroundColor = .brandMainColor
        addNotificationEnteringForeground()
        
        filterHorizontalScrollView.delegate = self
        
        filterHorizontalScrollView.data = DataGenerator.filterData()
        tableView.tableHeaderView = filterHorizontalScrollView
        tableView.tableHeaderView?.frame = CGRect(x: 0, y: 0, width: (tableView.tableHeaderView?.frame.width)!, height: 30)
        
        for cell in listOfCells {
            tableView.register(cell)
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 12
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if visibleSectionIndices.contains(section) {
            return 1
        } else {
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let identifier = listOfCells[indexPath.section].reuseIdentifier
        let cell = tableView.dequeueCell(withReuseIdentifier: identifier, for: indexPath)
        
        switch cell {
            case let cell as PainRateCell:
                cell.collectionViewModels = DataGenerator.painRateData()
            case let cell as BodyPainCell:
                cell.collectionViewModels = DataGenerator.bodyPainData()
            case let cell as PainLocationCell:
                cell.collectionViewModels = DataGenerator.painLocationData()
            default:
                break
        }
        return cell
    }
}

extension AutolayoutPracticeViewController: HorizontalScrollViewDelegate {
    func didSelectCell(at indexPath: Int) {
        if indexPath == 0 {
            visibleSectionIndices = DataGenerator.filterData().enumerated().map { $0.offset }
        } else {
            visibleSectionIndices = [indexPath]
        }
        tableView.reloadData()
    }
}

private extension AutolayoutPracticeViewController {
    func addNotificationEnteringForeground() {
        NotificationCenter.default.addObserver(self, selector: #selector(appWillEnterForeground), name: UIApplication.willEnterForegroundNotification, object: nil)
    }
    
    @objc func appWillEnterForeground() {
        tableView.setContentOffset(.zero, animated: true)
        filterHorizontalScrollView.collectionView.selectItem(at: IndexPath(item: 0, section: 0), animated: false, scrollPosition: [])
        filterHorizontalScrollView.collectionView.setContentOffset(.zero, animated: true)
        visibleSectionIndices = DataGenerator.filterData().enumerated().map { $0.offset }
        tableView.reloadData()
    }
}
